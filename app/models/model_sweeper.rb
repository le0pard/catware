class ModelSweeper < ActionController::Caching::Sweeper
  observe Project, MediaAttachment, MediaVideo, PdfAttachment
 
  def after_create(object)
    expire_cache_for(object)
  end

  def after_update(object)
    expire_cache_for(object)
  end

  def after_destroy(object)
    expire_cache_for(object)
  end
 
  private
  def expire_cache_for(object)
    expire_page(projects_path)
    Project.all.each do |project|
      expire_page(show_project_path(project))
    end
    expire_page(web_services_path)
    expire_page(mobile_services_path)
    expire_page(mobile_news_services_path)
    expire_page(thank_you_contacts_path)
    expire_page(page_not_found_path)
    expire_page(root_path)
  end
end