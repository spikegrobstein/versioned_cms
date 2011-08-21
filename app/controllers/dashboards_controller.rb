class DashboardsController < ApplicationController
  
  before_filter :authenticate_user!
  
  def show
    @projects = Project.all
    @publications = Publication.all
  end
  
end
