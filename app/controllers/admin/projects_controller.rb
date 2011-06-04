class Admin::ProjectsController < Admin::BaseController
  
  def index
    @projects = Project.order("created_at DESC").page(params[:page])
  end
  
end
