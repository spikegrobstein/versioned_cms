module ProjectsHelper
  
  def project_pages(project)
    pages = []
    pages << [ 'Project Page', '::project_page::' ]
    
    project.pages.each { |p| pages << [ p.title, p.slug ] }
    
    pages
  end
  
end
