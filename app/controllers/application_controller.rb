class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_settings

  def load_settings
    @setting = Setting.find(1)
  end
  
end
