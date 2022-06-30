class DirectorsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    directors = Director.all
    # include: ['movies', 'movies.reviews'] is to override that AMS only nests associations one level deep
    render json: directors, include: ['movies', 'movies.reviews']
  end

  def show
    director = Director.find(params[:id])
    render json: director, include: ['movies', 'movies.reviews']
  end

  private

  def render_not_found_response
    render json: { error: "Director not found" }, status: :not_found
  end

end
