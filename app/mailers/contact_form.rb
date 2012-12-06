class ContactForm < ActionMailer::Base
  
  # default from: "aaron@lovesyoudesign.com"
  # default to: "aaron@lovesyoudesign.com"

  def email_form(message)
  	@message = message
  	mail subject: "Blue Door Cafe #{message.name} left a message"
  end

end
