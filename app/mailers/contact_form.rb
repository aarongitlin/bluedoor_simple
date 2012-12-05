class ContactForm < ActionMailer::Base
  
  default from: "aaron@lovesyoudesign.com"
  default to: "aaron@lovesyoudesign.com"

  def email_form(message)
  	@message = message
  	mail subject: "[Your Homepage] #{message.name} left a message"
  end

end
