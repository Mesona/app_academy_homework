class Api::PokemonController < ApplicationController
  def index
    render json: Pokemon.all
  end

  def show
    # render json: Pokemon.find(params[:id])
    @pokemon = Pokemon.find(params[:id])
    render :show
  end
end
