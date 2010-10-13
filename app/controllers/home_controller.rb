class HomeController < ApplicationController
  def index
    @users = User.all

    respond_to do |format|
       format.html
       format.mobile { render :layout => false }
     end
  end

end
