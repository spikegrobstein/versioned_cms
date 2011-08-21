class ContentVersionsController < ApplicationController
  before_filter :find_project, :find_page
  
  # called when changing a Page's current_version
  def update
    @page.current_version = @page.content_versions.find(params[:id])
    @page.current_version.deleted = false
    @page.current_version.save!
    @page.save!
    
    flash[:notice] = "Changed current version to: #{@page.current_version.created_at}"
    redirect_to edit_project_page_path(@page.project, @page)
  end
  
  def destroy
    @c = @page.content_versions.find(params[:id])
    
    if @page.current_version != @c
      @c.deleted = true
      @c.save!
    end
    
    flash[:notice] = "Deleted current version: #{@page.current_version.created_at}"
    redirect_to edit_project_page_path(@page.project, @page)
  end
  
end
