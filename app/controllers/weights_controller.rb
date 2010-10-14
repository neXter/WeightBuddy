class WeightsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @title = "Track new Weight"
    @weight = Weight.new
  end
  
  def chart
  end
end
