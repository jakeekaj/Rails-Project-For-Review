class ReviewsController < ApplicationController
  before_action :set_movie_and_review, only: [:show, :edit, :update, :destroy]

  def new
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.build
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.create(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to movie_path(@movie), notice: 'Review was successfully added.'
    else
      render :new, notice: 'Review was not added.'
    end
  end

  def edit
  end

  def show
  end

  def update
    @review.update(review_params)
    if @review.save
      redirect_to movie_review_path(@movie, @review), notice: 'Review was successfully edited.'
    else
      render :edit, notice: 'Review was not edited.'
    end
  end

  def destroy
    @review.destroy
    redirect_to @movie, notice: 'Review was successfully deleted.'
  end


  private

  def set_movie_and_review
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.find_by(id: params[:id])
  end

  def review_params
    params.require(:review).permit(:title, :content,:rating)
  end



end
