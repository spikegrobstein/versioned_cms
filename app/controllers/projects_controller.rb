class ProjectsController < ApplicationController
  
  def index
    @projects = Project.all
    
    respond_to do |format|
      format.html
      format.xml { render :xml => @projects }
      format.json { render :json => @projects }
    end
  end
  
  def show
    redirect_to edit_project_path(params[:id])
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(params[:project])
    
    begin
      @project.save!
      flash[:notice] = "Created new project! w00t!"
      redirect_to edit_project_path(@project)
    rescue ActiveRecord::RecordInvalid
      render :action => :new
    end
  end
  
  def edit
    @project = Project.find_by_slug(params[:id])
  end
  
  def update
    @project = Project.find_by_slug(params[:id])
    
    begin
      @project.update_attributes!(params[:project])
      flash[:notice] = "Saved project!"
      
      redirect_to edit_project_path(@project)
    rescue ActiveRecord::RecordInvalid
      render :action => :edit
    end
  end
  
  def destroy
    @project = Project.find_by_slug(params[:id])
    @project.destroy
    
    flash[:notice] = "Deleted project!"
    
    redirect_to projects_path
  end
  
end
