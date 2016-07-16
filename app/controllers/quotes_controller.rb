class QuotesController < ApplicationController
  def create
    @quote = Quote.new(quote_params)
    @movie = @quote.movie
    
    if @quote.save
      render json:  @quote, serializer: QuoteSerializer
    else
      render 'movies/show'
    end
  end

  private

  def quote_params
    params.require(:quote).permit(:text, :movie_id)
  end
end
