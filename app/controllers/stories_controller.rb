class StoriesController < ApplicationController
  def index
    @stories = Story.storyline
  end

  def new
    @story = Story.new
    authorize @story
  end

  def create
    @story = Story.new(story_params)
    authorize @story
    if @story.save
      flash[:notice] = "Comment was saved"
      redirect_to :back
    else
      flash[:error] = "There was an error."
      render :new
    end
 end

  def edit
    session[:return_to] = request.referer
    @story = Story.find(params[:id])
  end

  def destroy
    @story = Story.find(params[:id])
    authorize @story
    if @story.destroy
    redirect_to session.delete(:return_to)
    flash[:notice] = "Comment removed"
    else
      flash[:error] = "There was an error."
      render :show
    end
  end

  def show
    @story = Story.find(params[:id])
  end

  def update
    @story = Story.find(params[:id])
    authorize @story
    if @story.update(story_params)
      flash[:notice] = "Updated."
      redirect_to session.delete(:return_to)
    else
      flash[:error] = "There was an error updating this story."
      render :edit
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def story_params
    params.require(:story).permit(:title, :body, :user_id, :song_id, :release_id, :show_id)
  end
end