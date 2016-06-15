class ReviewsController < ApplicationController
  before_action :set_movie_and_review, only: [:show, :edit, :update, :destroy]

  def new
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.build
  end


  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.create(review_params)
    @movie.update_rating(@review.rating)

    if @review.save
      @movie.save
      redirect_to movie_path(@movie), notice: 'Review was successfully added.'
    else
      render :new, notice: 'Review was not added.'
    end
  end

  def index
  end

  def edit
  end

  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @review, serializer: ReviewSerializer }
    end
  end

  def update
    @review.update(review_params)
    @movie.update_rating(@review.rating)
    @movie.save
    if @review.save
      redirect_to movie_review_path(@movie, @review), notice: 'Review was successfully edited.'
    else
      render :edit, notice: 'Review was not edited.'
    end
  end

  def destroy
    @review.destroy
    @movie.update_rating(0)
    @movie.save
    redirect_to @movie, notice: 'Review was successfully deleted.'
  end

  def user_reviews
    @reviews =  current_user.reviews
    render :index
  end



  private

  def set_movie_and_review
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.find_by(id: params[:id])
  end

  def review_params
    params.require(:review).permit(:title, :content,:rating, :user_id)
  end



end
