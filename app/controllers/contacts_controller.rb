class ContactsController < ApplicationController
  
  def index
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(params[:contact])
    if @contact.valid?
      flash[:notice] = "Thank you"
      redirect_to :action => :index
    else
      render :action => :index
    end
  end
  
end
