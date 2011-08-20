require 'FileUtils'

class PagesController < ApplicationController
  
  before_filter :find_project
  
  # this action will render the page and is useful for seeing what's going on.
  def show
    @page = @project.pages.find_by_slug(params[:id])
  end
  
  def new
    @page = @project.pages.build
  end
  
  def create
    @page = @project.pages.build(params[:page])
    
    begin
      @page.save!
      
      flash[:notice] = "Created new page!"
      redirect_to edit_project_path(@project)
    rescue ActiveRecord::RecordInvalid
      render :action => :create
    end
  end
  
  def edit
    @page = @project.pages.find_by_slug(params[:id])
  end
  
  def update
    @page = @project.pages.find_by_slug(params[:id])
    
    begin
      @page.update_attributes!(params[:page])
      flash[:notice] = "Updated page!"
      redirect_to edit_project_path(@project)
    rescue ActiveRecord::RecordInvalid
      render :action => :edit
    end
  end
  
  def destroy
    @page = @project.pages.find_by_slug(params[:id])
    
    @page.destroy
    
    flash[:notice] = "Deleted page!"
    
    redirect_to edit_project_path(@project)
  end
  
  # writes static files of all the project pages
  def publish
    stamp = Time.now.utc.strftime("%Y%m%d%H%M.%S")
    release_path = File.join(Rails.root, 'published', 'releases', stamp)
    
    logger.debug("writing to directory: #{release_path}")
    
    Project.all.each do |project|
      project_path = File.join(release_path, project.slug)
      logger.debug("writing file to: #{project_path}")
      FileUtils.makedirs(project_path)
      
      @project = project
      @project.pages.each do |page|
        @page = page
        page_path = File.join(project_path, "#{page.slug}.html")
        logger.debug("writing page to: #{page_path}")
        
        # render the page
        content = render_to_string(:action => :show)
        
        # write the data
        f = File.new(page_path, 'w')
        f.write(content)
        f.close
      end
    end
    
    # once we've written every page, now we want to copy the CSS and JS out of the public dir and into the new published dir
    %w( javascripts images stylesheets ).each do |public_dir|
      FileUtils.cp_r File.join(Rails.root, 'public', public_dir), release_path
    end
    
    # symlink to a current directory
    current_path = File.join(Rails.root, 'published', 'current')
    if File.exists? current_path
      FileUtils.rm current_path
    end
    
    FileUtils.ln_s release_path, current_path
    
    flash[:notice] = "Successfully published all content!"
    redirect_to projects_path
  end
  
end
