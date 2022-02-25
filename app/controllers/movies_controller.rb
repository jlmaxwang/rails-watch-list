class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.all
  end

  def show
  end

  def edit
  end

  def update
    if @movie.update(movie_param)
      redirect_to movies_path, notice: 'Movie was successfully updated.'
    else
      render :edit
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movie_param)
    if @movie.save
      redirect_to movie_path(@movie), notice: 'Movie was successfully created.'
    else
      render :new, notice:'Please try again.'
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_param
    params.require(:movie).permit(:name, :overview, :poster_url, :rating)
  end
end
