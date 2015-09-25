class PerformancesController < ApplicationController
  def create
    @show = Show.find(params[:show_id])
      @Performance = Performance.new(show_id: @show.id, act_id: params[:act_id])
    if @Performance.save
      flash[:notice] = "Act added to show"
      redirect_to edit_show_path(@show)
    else
      flash[:error] = "There was an error."
      render :new
    end
  end

  def destroy
    @show = Show.find(params[:show_id])
    @Performance =  Performance.where(show_id: @show.id, act_id: params[:act_id]).first
    if @Performance.destroy
      flash[:notice] = "Act removed from performance"
      redirect_to edit_show_path(@show)
    else
      flash[:error] = "There was an error."
      render :show
    end
  end
end
