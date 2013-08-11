class SleepsController < ApplicationController

  def index
    @sleeps = Sleep.all
  end

  def show
    @sleep = Sleep.find(params[:id])
  end

end
