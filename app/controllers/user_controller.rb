class WelcomeController < ApplicationController

  def show
    @song = Song.find(params[:id])
  end

  def edit
  end

end
