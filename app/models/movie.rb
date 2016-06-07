class Movie < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews
  validates :title, presence: true
  validates :synopsis, presence: true
  validates :year, presence: true, inclusion: { in: 1900..Date.today.year },
    format: {
      with: /(19|20)\d{2}/i,
      message: "should be a four-digit year"
    }
    accepts_nested_attributes_for :reviews, reject_if: :all_blank



  def reviews_attributes=(attributes)
  if attributes["0"]["title"] == "" && attributes["0"]["content"] == "" && attributes["0"]["rating"] == ""
  else
    attributes.values.each do |attribute|
      review = Review.find_or_create_by(attribute)
      review.user_id = self.user_id
      self.reviews << review
      self.update_rating(review.rating)
      end
    end
  end

  def update_rating(rating)
    if self.rating.nil?
      self.rating = rating
    elsif
      self.reviews.size == 0
      self.rating = nil
    else
      count = self.reviews.size
      total = 0.0
      self.reviews.each do |review|
      total += review.rating
      end
      self.rating = total / count.to_f
    end
  end





end
