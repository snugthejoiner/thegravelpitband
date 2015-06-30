class ReleasesController < ApplicationController
  before_action

  def index
    @releases = Release.all
  end

  def new
    @release = Release.new
  end

  def create
    @release = Release.new(release_params)

    if @release.save
      flash[:notice] = "Release was created."
      redirect_to @release
    else
      flash[:error] = "There was an error saving the release."
      render :new
    end
  end

  def edit
    @release = Release.find(params[:id])
  end

  def destroy
    @release.destroy
  end

  def show
    @release = Release.find(params[:id])
  end

  def update
    @release = Release.find(params[:id])
    if @release.update(song_params)
      flash[:notice] = "This release has been updated."
      redirect_to @release
    else
      flash[:error] = "There was an error updating the release."
      render :edit
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def release_params
    params.require(:release).permit(:title, :release_date)
  end

end
