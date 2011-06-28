class ProjectsController < ApplicationController
  
  caches_page :index, :show
  
  def index
    @projects = Project.order("created_at DESC").page(params[:page])
  end
  
  def show
    @project = Project.find_by_cached_slug params[:slug]
    redirect_page_not_found if @project.nil?
  end
  
end
