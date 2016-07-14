class Review < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :movie

  validates   :title,
              :content, presence: true

  validates   :rating, numericality: { greater_than_or_equal_to: 0.0, less_than_or_equal_to: 10.0, precision: 1 }
end
