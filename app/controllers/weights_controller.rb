class WeightsController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => [:create]

  def index
    @weights = Weight.all
  end

  def new
    
  end

  def show
    @weight = Weight.find(params[:id])
  end

  def create

    @weight = Weight.new
    @weight.weight = params[:post][:weight]

    @weight.save
    redirect_to @weight

  end

  private
    def post_params
      params.require(:weight).permit(:weight)
    end

end
