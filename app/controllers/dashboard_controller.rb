class DashboardController < ApplicationController
  
  def index
    
  end
  
  def mainteinance
    render "layouts/maintenance", :layout => false
  end
  
end
