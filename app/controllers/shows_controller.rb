class ShowsController < ApplicationController
  before_action :set_show, only: [:show, :update, :destroy]

  # GET /shows
  def index
    @shows = Show.all

    render json: @shows
  end

  # GET /shows/1
  def show
    render json: @show
  end

  # POST /shows
  def create
    @show = Show.new(show_params)

    if @show.save
      render json: @show, status: :created, location: @show
    else
      render json: @show.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shows/1
  def update
    if @show.update(show_params)
      render json: @show
    else
      render json: @show.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shows/1
  def destroy
    @show.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_show
      @show = Show.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def show_params
      params.require(:show).permit(:title, :description, :genre, :image)
    end
end
