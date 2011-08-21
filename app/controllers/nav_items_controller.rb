class NavItemsController < ApplicationController
  before_filter :authenticate_user!
  
  before_filter :find_project
  
  def show
    redirect_to edit_project_nav_item_path(@project, params[:id])
  end
  
  def new
    @nav_item = @project.nav_items.build
  end
  
  def create
    @nav_item = @project.nav_items.build(params[:nav_item])
    
    begin
      @nav_item.save!
      flash[:notice] = "Created new navigation item! w00t!"
      redirect_to edit_project_path(@project)
    rescue ActiveRecord::RecordInvalid
      render :action => :new
    end
  end
  
  def edit
    @nav_item = @project.nav_items.find(params[:id])
  end
  
  def update
    @nav_item = @project.nav_items.find(params[:id])
    
    begin
      @nav_item.update_attributes!(params[:nav_item])
      flash[:notice] = "Saved navigation item!"
      
      redirect_to edit_project_path(@project)
    rescue ActiveRecord::RecordInvalid
      render :action => :edit
    end
  end
  
  def destroy
    @nav_item = @project.nav_items.find(params[:id])
    @nav_item.destroy
    
    flash[:notice] = "Deleted Navigation item!"
    
    redirect_to edit_project_path(@project)
  end
end
