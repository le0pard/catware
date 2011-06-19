class Notifications < ActionMailer::Base
  default from: "support@catware.co"
  layout 'mail'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.contact.subject
  #
  def contact(contact_obj)
    @contact = contact_obj
    mail to: "contacts@catware.co", 
         subject: "New Customer Contact Us"
  end
end
