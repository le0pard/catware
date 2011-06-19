class ContactsController < ApplicationController
  
  def index
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(params[:contact])
    if @contact.save
      #flash[:notice] = "Thank you"
      Notifications.contact(@contact).deliver
      redirect_to :action => :thank_you
    else
      render :action => :index
    end
  end
  
  def thank_you
    
  end
  
end
