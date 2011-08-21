class DashboardsController < ApplicationController
  
  before_filter :authenticate_user!
  
  def show
    @projects = Project.all
    @publications = Publication.order('published_at desc').all
  end
  
end
