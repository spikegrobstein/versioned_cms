class PagesController < ApplicationController
  
  before_filter :find_project
  
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
    @page = @project.pages.find(params[:id])
  end
  
  def update
    @page = @project.pages.find(params[:id])
    
    begin
      @page.update_attributes!(params[:page])
      flash[:notice] = "Updated page!"
      redirect_to edit_project_path(@project)
    rescue ActiveRecord::RecordInvalid
      render :action => :edit
    end
  end
  
  def destroy
    @page = @project.pages.find(params[:id])
    
    @page.destroy
    
    flash[:notice] = "Deleted page!"
    
    redirect_to edit_project_path(@project)
  end
  
end
