class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
  end

  def edit
  end

  def update
    if @movie.update(movie_param)
      redirect_to movies_path
    else
      render :edit
    end
  end

  def new
    @movie = movie.new
  end

  def create
    @movie = movie.create(movie_param)
    if @movie.save
      redirect_to movie_path(@movie)
    else
      render :new
    end
  end

  private

  def set_movie
    @movie = movie.find(params[:id])
  end

  def movie_param
    params.require(:movie).permit(:name, :overview, :poster_url, :rating)
  end
end
