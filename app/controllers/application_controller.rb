class ApplicationController < ActionController::Base
  protect_from_forgery
  
  
  protected
  
  def find_project
    @project = Project.find_by_slug(params[:project_id])
  end
  
  def find_page
    @page = @project.pages.find_by_slug(params[:page_id])
  end
  
end
