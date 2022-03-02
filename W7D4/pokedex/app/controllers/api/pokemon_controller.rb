class Api::PokemonController < ApplicationController
  def index
    @pokemon = Pokemon.all 
    render :index 
  end

  def show
    # render json: Pokemon.find(params[:id])
    @pokemon = Pokemon.find(params[:id])
    render :show
  end
end
