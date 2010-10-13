class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])

    respond_to do |format|
       format.html
       format.mobile { render :layout => false }
     end
  end

end
