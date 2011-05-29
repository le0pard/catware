class Admin::BaseController < ApplicationController
  layout "admin"
  abstract!
  before_filter :is_login
  
  private
  
  def is_login
    redirect_to admin_signin_path unless user_signed_in?
  end
end
