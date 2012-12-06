class HomeController < ApplicationController

  def index
  	@message = Message.new
  end

  def send_email_form
  	@message = Message.new(params[:message])
  	
  	if @message.valid?
  		ContactForm.email_form(@message).deliver
      Notifier.thankyou_email(@message).deliver
  		redirect_to root_path, notice: "Email successfully sent."
  	else
  		flash.now.alert = "Email could not be sent. Please check your entries."
  		render :index
  	end

  end
end
