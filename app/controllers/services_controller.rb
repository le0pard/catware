class ServicesController < ApplicationController
  before_filter :get_projects
  #caches_page :mobile, :web
  
  def mobile
    
  end
  
  def web
    
  end
  
  private
  
  def get_projects
    @last_projects = Project.order("created_at DESC").limit(10)
  end
  
end
