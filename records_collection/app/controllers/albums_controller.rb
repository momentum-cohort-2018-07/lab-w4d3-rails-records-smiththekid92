class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def edit
      @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    
    if @album.update(album_params)
      redirect_to @album
    else
      render 'edit'
    end
  end

  def create
    params[:albums]

    @album = Album.new(album_params)

    respond_to do |format|
      if @album.save
        format.html { redirect_to @album, notice: 'Album successfully created!' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to albums_url, notice: 'Album destroyed!'
  end

  private

  def set_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:title, :artist, :year)
  end
end
