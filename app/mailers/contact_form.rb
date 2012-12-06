class ContactForm < ActionMailer::Base
  
  default from: "hello@bluedoorcafe.org"
  default to: "hello@bluedoorcafe.org"

  def email_form(message)
  	@message = message
  	mail subject: "Blue Door Cafe #{message.name} left a message"
  end

end
