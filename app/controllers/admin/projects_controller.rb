class Admin::ProjectsController < Admin::BaseController
  before_filter :find_project, :only => [:edit, :update, :destroy]
  
  def index
    @projects = Project.order("created_at DESC").page(params[:page])
  end
  
  def new
    @project = Project.new
    @project.media_attachments.build
    @project.media_videos.build
  end
  
  def create
    @project = Project.new(params[:project])
    if @project.save
      redirect_to :action => :edit, :id => @project.id
    else
      render :action => :new
    end
  end
  
  def edit
    @project.media_videos.build
  end
  
  def update
    if @project.update_attributes(params[:project])
      redirect_to :action => :edit, :id => @project.id
    else
      render :action => :edit, :id => @project.id
    end
  end
  
  def destroy
    @project.destroy
    redirect_to :action => :index
  end
  
  private
  
  def find_project
    @project = Project.find(params[:id])
  end
  
end
