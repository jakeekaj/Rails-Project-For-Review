class Review < ActiveRecord::Base
  belongs_to  :reviewer, class_name: 'User', foreign_key: :user_id
  belongs_to  :movie

  validates   :title,
              :content,
              presence: true

  validates   :rating, numericality: { greater_than_or_equal_to: 0.0, less_than_or_equal_to: 10.0, precision: 1 }

  before_save   :set_reviewer
  after_commit  :update_movie_rating

  private

  def set_reviewer
    self.user_id = User.current_id
  end

  def update_movie_rating
    movie.update_rating
  end
end
