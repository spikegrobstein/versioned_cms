module ApplicationHelper
  
  def extra_head( &block )
    @extra_head = true
    content_for :extra_head do
      block.call
    end
  end
  
  def markdown(text)  
    Redcarpet.new(text).to_html.html_safe  
  end
  
  def form_text_field(form, field, options={})
    render :partial => 'shared/form_text_field', :locals => { :form => form, :field => field, :options => options }
  end
  
  def form_text_area(form, field, options={})
    render :partial => 'shared/form_text_area', :locals => { :form => form, :field => field, :options => options }
  end
  
  def form_check_box(form, field, options={})
    render :partial => 'shared/form_check_box', :locals => { :form => form, :field => field, :options => options }
  end
  
  def nav_item_url(nav_item)
    return nav_item.url unless nav_item.url.match(/^::(.+?)::$/)
    
    page = $1
    
    if page == 'project_page'
      return nav_item.project.url
    else
      raise "Unknown page!"
    end
  end
  
end
