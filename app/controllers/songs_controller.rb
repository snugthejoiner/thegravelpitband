class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    if @song.save
      flash[:notice] = "Song was created."
      redirect_to @song
    else
      flash[:error] = "There was an error saving the song."
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def destroy
  end

  def show
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    # authorize @song
    if @song.update(song_params)
      flash[:notice] = "This song has been updated."
      redirect_to @song
    else
      flash[:error] = "There was an error updating the song."
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_song
    @song = Song.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:title, :lyrics)
    end
end
