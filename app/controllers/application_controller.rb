class ApplicationController < ActionController::Base
  protect_from_forgery
  
  
  protected
  
  def find_project
    @project = Project.find_by_slug(params[:project_id])
  end
  
end
