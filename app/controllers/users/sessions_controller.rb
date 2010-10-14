# Needed to be able to login with Devise & jQtouch using AJAX queries
# found via Devise Google Group Messages
# http://gist.github.com/418243

class Users::SessionsController < Devise::SessionsController
  def create   
    resource = warden.authenticate!(:scope => resource_name, :recall => "failure")
    set_flash_message :notice, :signed_in 
    sign_in_and_redirect(resource_name, resource)
  end
  
  def sign_in_and_redirect(resource_or_scope, resource=nil)
    scope      = Devise::Mapping.find_scope!(resource_or_scope)
    resource ||= resource_or_scope
    sign_in(scope, resource) unless warden.user(scope) == resource
    render "home/index", :mobile => { :success => true, :redirect  => stored_location_for(scope) || after_sign_in_path_for(resource) }, :layout => false
  end
            
  def failure
    render "users/sessions/new", :mobile => {:success => false, :errors => {:reason => "Login failed. Try again"}}, :layout => false
  end   
  
end