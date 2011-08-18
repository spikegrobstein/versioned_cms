class NavItemsController < ApplicationController
  def index
    @nav_items = NavItem.all
  end
  
  def show
    redirect_to edit_nav_item_path(params[:id])
  end
  
  def new
    @nav_item = NavItem.new
  end
  
  def create
    @nav_item = NavItem.new(params[:nav_item])
    
    begin
      @nav_item.save!
      flash[:notice] = "Created new navigation item! w00t!"
      redirect_to edit_nav_item_path(@nav_item)
    rescue ActiveRecord::RecordInvalid
      render :action => :new
    end
  end
  
  def edit
    @nav_item = NavItem.find(params[:id])
  end
  
  def update
    @nav_item = NavItem.find(params[:id])
    
    begin
      @nav_item.update_attributes!(params[:nav_item])
      flash[:notice] = "Saved navigation item!"
      
      redirect_to edit_nav_item_path(@nav_item)
    rescue ActiveRecord::RecordInvalid
      render :action => :edit
    end
  end
  
  def destroy
    @nav_item = NavItem.find(params[:id])
    @nav_item.destroy
    
    flash[:notice] = "Deleted Navigation item!"
    
    redirect_to nav_items_path
  end
end
