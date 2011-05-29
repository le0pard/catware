class Admin::UserSessionsController < ApplicationController
  layout 'sign'
  before_filter :user_signed_in?, :only => [:delete]
  
  def new
    @user = User.new
  end
  
  def create
    if user = User.find_by_email(params[:user][:email]).try(:authenticate, params[:user][:password])
      session[:user_id] = user.id
      redirect_to admin_root_path
    else
      flash[:error] = "bad email/password combination"
      redirect_to :action => :new
    end
  end
 
  def destroy
    session.delete(:user_id)
    redirect_to :action => :new
  end
end
