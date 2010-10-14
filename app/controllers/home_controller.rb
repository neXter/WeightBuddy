class HomeController < ApplicationController
  def index
    @users = User.all
    @title = "WeightBuddy"

  end

end
