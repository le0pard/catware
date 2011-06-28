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
    expire_page(:controller => 'projects', :action => 'index')
    Project.all.each do |project|
      expire_page(:controller => 'projects', :action => 'show', :id => project)
    end
    expire_page(:controller => 'services', :action => 'mobile')
    expire_page(:controller => 'services', :action => 'web')
    expire_page(:controller => 'services', :action => 'mobile_news')
    expire_page(:controller => 'contacts', :action => 'thank_you')
    expire_page(:controller => 'errors', :action => 'page_not_found')
    expire_page(:controller => 'dashboard', :action => 'index')
  end
end