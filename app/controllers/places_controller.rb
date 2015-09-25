class PlacesController < ApplicationController
  def index
    @places = Place.all.abc
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)

    if @place.save
      flash[:notice] = "Venue was created."
      redirect_to places_path
    else
      flash[:error] = "There was an error saving the venue."
      render :new
    end
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
    if @place.update(place_params)
      flash[:notice] = "The venue #{@place.name}has been updated."
      redirect_to places_path
    else
      flash[:error] = "There was an error updating the venue."
      render :edit
    end
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to places_path
  end

  def place_params
    params.require(:place).permit(:name, :address, :city, :state)
  end
end
