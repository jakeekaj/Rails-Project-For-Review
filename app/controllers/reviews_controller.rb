class ReviewsController < ApplicationController

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
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.find_by(id: params[:id])
  end

  private

  def review_params
    params.require(:review).permit(:title, :content,:rating)
  end

end
