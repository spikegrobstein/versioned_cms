class ContentVersionsController < ApplicationController
  before_filter :find_page
  
  # called when changing a Page's current_version
  def update
    @page.current_version = @page.content_versions.find(params[:id])
    @page.save!
    redirect_to edit_project_page_path(@page.project, @page)
  end
  
  def destroy
    @c = @page.content_versions.find(params[:id])
    
    if @page.current_version != @c
      @c.destroy
    end
    
    redirect_to edit_project_page_path(@page.project, @page)
  end
  
end
