class WatersController < ApplicationController

  def index
    @waters = Water.all
  end

  def show
    @water = Water.find(params[:id])
  end

end
