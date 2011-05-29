class Admin::UsersController < Admin::BaseController
  
  def index
    @users = User.order(:email).page params[:page]
  end
  
end
