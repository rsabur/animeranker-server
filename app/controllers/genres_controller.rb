class GenresController < ApplicationController
  before_action :set_genre, only: [:show, :update, :destroy]

  # GET /genres
  def index
    
    @genres = Genre.all

    render json: GenreSerializer.new(@genres)

  end

  # GET /genres/1
  def show
    render json: GenreSerializer.new(@genre)
  end

  # POST /genres
  def create
    @genre = Genre.new(genre_params)

    if @genre.save
      render json: @genre, status: :created, location: @genre
    else
      render json: @genre.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /genres/1
  def update
    if @genre.update(genre_params)
      render json: @genre
    else
      render json: @genre.errors, status: :unprocessable_entity
    end
  end

  # DELETE /genres/1
  def destroy
    @genre.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_genre
     
      #api call to set genre
      Genre.api(params[:id])
  
      # query genre by params[:id] to find all genres by its kind i.e. "tv"
      @genre = Genre.where(kind: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def genre_params
      params.require(:genre).permit(:kind)
    end
end
