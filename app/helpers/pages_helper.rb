module PagesHelper
  def build_iframe_code(project, page)
    "<iframe src='#{project_page_url(project, page)}' name='#{page.title}' style='width: 600px; height: 250px'></iframe>"
  end 
end
