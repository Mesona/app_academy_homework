class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def new
    @band = Band.find(params[:band_id])
    @album = Album.new(band_id: params[:band_id])

    render :new
  end

  def edit
    @album = Album.find(params[:id])

    render :edit
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      flash[:success] = "Album successfully created"
      redirect_to album_url(@album)
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  
  def update
    @album = Album.find(params[:id])
      if @album.update_attributes(album_params)
        flash[:success] = "Album was successfully updated"
        redirect_to album_url(@album)
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end

  def destroy
    @album= Album.find(params[:id])
    if @album.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to albums_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to new_band_album_url
    end
  end
  

  private
    def album_params
      params.require(:album).permit(:band_id, :title, :year, :live_version)
    end
end
