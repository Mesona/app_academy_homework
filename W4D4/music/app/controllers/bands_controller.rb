class BandsController < ApplicationController

  def index
    @bands = Band.all
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def new
    @band = Band.new

    render :new
  end

  def edit
    @band = Band.find(params[:id])

    render :edit
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      flash[:success] = "Band successfully created"
      redirect_to band_url(@band)
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  
  def update
    @band = Band.find(params[:id])
      if @band.update_attributes(band_params)
        flash[:success] = "Object was successfully updated"
        redirect_to band_url(@band)
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end
  
  def destroy
    @band = Band.find(params[:id])
    if @band.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to bands_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to bands_url
    end
  end
  

  private
    def band_params
      params.require(:band).permit(:name)
    end
end
