class StoriesController < ApplicationController
  def index
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)

    if @story.save
      flash[:notice] = "Succesfully created."
      redirect_to @story
    else
      flash[:error] = "There was an error saving the Story."
      render :new
    end
  end

  def edit
    @story = Story.find(params[:id])
  end

  def destroy
  end

  def show
    @story = Story.find(params[:id])
  end

  def update
    @story = Story.find(params[:id])
    # authorize @story
    if @story.update(story_params)
      flash[:notice] = "Updated."
      redirect_to @story
    else
      flash[:error] = "There was an error updating the Story."
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_song
    @story = Story.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def story_params
    params.require(:story).permit(:title, :body, :user_id, :song_id, :release_id)
  end