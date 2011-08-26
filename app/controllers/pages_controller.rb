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
    if @project.pages.count == 0
      @page = @project.pages.build({
        :title => 'Home'
      })
    else
      @page = @project.pages.build
    end
  end
  
  def create
    @page = @project.pages.build(params[:page])
    
    begin
      @page.save!
      
      flash[:notice] = "Created new page!"
      redirect_to edit_project_page_path(@project, @page)
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
  
end
