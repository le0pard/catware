class Admin::UsersController < Admin::BaseController
  before_filter :find_user, :only => [:edit, :update, :destroy]
  
  def index
    @users = User.order(:email).page(params[:page])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to :action => :edit, :id => @user.id
    else
      render :action => :new
    end
  end
  
  def edit
    #
  end
  
  def update
    if @user.update_attributes(params[:user])
      redirect_to :action => :edit, :id => @user.id
    else
      render :action => :edit, :id => @user.id
    end
  end
  
  def destroy
    @user.destroy
    redirect_to :action => :index
  end
  
  private
  
  def find_user
    @user = User.find(params[:id])
  end
  
end
