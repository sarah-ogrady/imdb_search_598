class MoviesController < ApplicationController
  def index
    if params[:query].present?
      # @movies = Movie.where("title @@ :query OR synopsis @@ :query", query: "%#{params[:query]}%")
      # sql_query = " \
      #   movies.title @@ :query \
      #   OR movies.synopsis @@ :query \
      #   OR directors.first_name @@ :query \
      #   OR directors.last_name @@ :query \
      # "
      # @movies = Movie.joins(:director).where(sql_query, query: "%#{params[:query]}%")
      # @movies = Movie.search_by_title_and_synopsis(params[:query])
      @movies = Movie.search(params[:query])
    else
      @movies = Movie.all
    end
  end
end
