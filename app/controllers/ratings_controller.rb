class RatingsController < ApplicationController
  def index
    @ratings = Rating.all
  end

  def new
    @rating = Rating.new
  end

  def create
    @rating = Rating.new(rating_params)

    if @rating.save
      flash[:notice] = "Your rating has been recorded."
      redirect_to :back
    else
      flash[:error] = "There was an error saving your rating."
      render :new
    end
    
  end

  def edit
    @rating = Rating.find(params[:id])
  end

  def destroy
    @rating.destroy
  end

  def show
    @rating = Rating.find(params[:id])    
  end

  def update
    @rating = Rating.find(params[:id])
    if @rating.update(rating_params)
      flash[:notice] = "Your rating has been updated."
      redirect_to @release
    else
      flash[:error] = "There was an error updating your rating. You may be stuck with it."
      render :edit
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:rating_value, :user_id, :song_id, :release_id)
  end

end
