module ApplicationHelper
  
  def project_menu_item(title, link, with_action = false, add_class = "")
    route_hash = Rails.application.routes.recognize_path(link) rescue {:controller => nil, :action => nil}
    unless route_hash[:controller].nil?
      boolean_menu = false
      if with_action
        boolean_menu = (controller.controller_path == route_hash[:controller] && controller.action_name == route_hash[:action])
      else
        boolean_menu = (controller.controller_path == route_hash[:controller])
      end
      active_li = "class=\"#{add_class}\""
      active_li = "class=\"active #{add_class}\"" if boolean_menu
      "<li #{active_li}>#{link_to(title, link)}</li>".html_safe
    end
  end
  
end
