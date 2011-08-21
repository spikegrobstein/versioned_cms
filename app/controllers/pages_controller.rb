require 'fileutils'

class PagesController < ApplicationController
  before_filter :authenticate_user!
  
  layout 'application'
  before_filter :find_project
  
  # this action will render the page and is useful for seeing what's going on.
  def show
    @page = @project.pages.find_by_slug(params[:id])
    
    render :layout => 'pages'
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
      redirect_to edit_project_page_path(@project, @page)
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
    release_path = File.join(PUBLISHING_CONFIG['location'], 'releases', stamp)
    FileUtils.makedirs(release_path)
    
    logger.debug("writing to directory: #{release_path}")
    
    project_xml = Project.all.to_xml
    project_json = Project.all.to_json
    
    f = File.new(File.join(release_path, 'projects.xml'), 'w')
    f.write(project_xml)
    f.close
    
    f = File.new(File.join(release_path, 'projects.json'), 'w')
    f.write(project_json)
    f.close
    
    Project.all.each do |project|
      if project.name == 'sadistech'
        project_path = release_path
      else
        project_path = File.join(release_path, project.slug)
      end
      
      logger.debug("writing file to: #{project_path}")
      FileUtils.makedirs(project_path)
      
      @project = project
      @project.pages.each do |page|
        @page = page
        page_path = File.join(project_path, "#{page.slug}.html")
        logger.debug("writing page to: #{page_path}")
        
        # render the page
        content = render_to_string(:action => :show, :layout => 'pages')
        
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
    current_path = File.join(PUBLISHING_CONFIG['location'], 'current')
    if File.exists? current_path
      FileUtils.rm current_path
    end
    
    FileUtils.ln_s release_path, current_path
    
    # do some cleanup
    cleanup_published_sites PUBLISHING_CONFIG['releases_to_keep']
    
    flash[:notice] = "Successfully published all content!"
    redirect_to projects_path
  end
  
  protected
  
  # cleans up previously deployed copies of the site
  def cleanup_published_sites(releases_to_keep=5)
    return if releases_to_keep < 1
     
    releases_path = File.join(PUBLISHING_CONFIG['location'], 'releases')
    
    releases = Dir["#{releases_path}/*"].sort
    
    if releases.length <= releases_to_keep
      logger.debug "there is only #{releases.length} releases. not cleaning up."
      return
    end
    
    # ok, if we got this far, then we need to do some cleanup
    
    # delete each release
    releases[0, releases.length - releases_to_keep].each do |release|
      FileUtils.rm_rf release
    end
  end
  
end
