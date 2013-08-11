class VitaminsController < ApplicationController

  def index
    @vitamins = Vitamin.all
  end

  def show
    @vitamin = Vitamin.find(params[:id])
  end

end
