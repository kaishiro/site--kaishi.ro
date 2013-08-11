class InputsController < ApplicationController
  
  skip_before_filter :verify_authenticity_token, :only => [:create]

  def index
    @inputs = Input.all
    @weights = Weight.all
  end

  def create

    @input = Input.new
    @input.body = params[:Body]

    @input.save
    redirect_to @input

  end

end
