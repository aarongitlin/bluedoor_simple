class Notifier < ActionMailer::Base
  default :from => "aaron@lovesyoudesign.com"


  # send a signup email to the user, pass in the user object that contains the user's email address
  def thankyou_email(message)
    @setting = Setting.find(1)
    mail( :to => message.email,
    :subject => "Thanks for the enquiry" 
    )
  end
end