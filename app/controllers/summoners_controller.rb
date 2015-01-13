class SummonersController < ApplicationController
  def show
  	@summoner = Summoner.find(params[:id])
  end

  def index
  	@summoners = Summoner.all
  end
end
