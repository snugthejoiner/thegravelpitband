class ActsController < ApplicationController

  def index
    @acts = Act.all
  end

  def show
    @act = Act.find(params[:id])
  end

  def new
    @act = Act.new
  end

  def edit
    @act = Act.find(params[:id])
  end

  def create
    @act = Act.new(show_params)

    respond_to do |format|
      if @act.save
        format.html { redirect_to @act, notice: 'Show was successfully created.' }
        format.json { render :act, status: :created, location: @act }
      else
        format.html { render :new }
        format.json { render json: @act.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @act = Act.find(params[:id])
    @act.destroy
    respond_to do |format|
      format.html { redirect_to acts_url, notice: 'Show was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_act
      @act = Act.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def show_params
      params.require(:act).permit(:name)
    end

end
