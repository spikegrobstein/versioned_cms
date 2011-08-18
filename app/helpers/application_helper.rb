module ApplicationHelper
  
  def form_text_field(form, field, title=nil)
    render :partial => 'shared/form_text_field', :locals => { :form => form, :field => field, :title => title }
  end
  
  def form_text_area(form, field, title=nil)
    render :partial => 'shared/form_text_area', :locals => { :form => form, :field => field, :title => title }
  end
  
end
