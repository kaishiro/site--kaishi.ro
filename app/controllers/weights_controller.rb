class WeightsController < ApplicationController

  def index
    @weights = Weight.all
  end

  def create

    @weight = Weight.new(post_params)

    @weight.save
    redirect_to @weight

  end

  private
    def post_params
      params.require(:body).permit(:body)
    end

end
