class Admin::BaseController < ApplicationController
  layout "admin"
  abstract!
  before_filter :is_login
  cache_sweeper :model_sweeper
  
  private
  
  def is_login
    redirect_to admin_signin_path unless user_signed_in?
  end
end
