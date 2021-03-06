class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.all

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @movies, each_serializer: MovieSerializer }
    end
  end

  # sort actions
  def sort
    return @movies = Movie.sorted_by_rating  if params[:rating]   == 'true'
    return @movies = Movie.sorted_by_year    if params[:year]     == 'true'
    return @movies = Movie.unrated           if params[:unrated]  == 'true'
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    @quote = Quote.new
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @movie, serializer: MovieSerializer }
    end
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit;end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_movie
    @movie = Movie.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def movie_params
    params.require(:movie).permit(:title, :year, :synopsis, :rating, :user_id, reviews_attributes: [:title, :content, :rating])
  end
end
