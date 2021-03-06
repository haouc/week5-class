class MoviesController < ApplicationController

  def index
    @movies = Movie.order('title asc')
  end

  def show
    @movie = Movie.find_by(id: params["id"])

    if @movie == nil
      redirect_to movies_url, notice: "Movie not found."
    end
  end

  def new
    @directors = Director.order('name')
  end

  def create
    movie = Movie.new
    movie.title = params[:title]
    movie.year = params[:year]
    movie.runtime = params[:runtime]
    movie.rated = params[:rated]
    movie.stars = params[:stars]
    movie.director_id = params[:director_id]
    movie.plot = params[:plot]
    movie.poster_url = params[:poster_url]
    movie.save
    redirect_to movies_url
  end

  def edit
    @movie = Movie.find_by(id: params["id"])
  end

  def update
    movie = Movie.find_by(id: params["id"])
    movie.title = params[:title]
    movie.year = params[:year]
    movie.runtime = params[:runtime]
    movie.rated = params[:rated]
    movie.stars = params[:stars]
    movie.director_id = params[:director_id]
    movie.plot = params[:plot]
    movie.poster_url = params[:poster_url]
    movie.save
    redirect_to movies_url
  end

  def destroy
    movie = Movie.find_by(id: params["id"])
    movie.delete
    redirect_to movies_url
  end

end
