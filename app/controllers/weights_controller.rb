class WeightsController < ApplicationController

  def index
    @weights = Weight.all
  end

  def show
    @weight = Weight.find(params[:id])
  end

#  def create
#    @weight = Weight.new
#    @weight.weight = params[:post][:weight]
#    @weight.save
#    redirect_to @weight
#  end


end
