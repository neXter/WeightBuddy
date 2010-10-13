class ApplicationController < ActionController::Base
  protect_from_forgery
  has_mobile_fu
  has_mobile_fu(true) # forcing mobile view
  
end
