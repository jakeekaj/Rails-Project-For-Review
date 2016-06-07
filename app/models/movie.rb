class Movie < ActiveRecord::Base
  has_one :user
  has_many :reviews
  has_many :users, through: :reviews
  validates :title, presence: true
  validates :synopsis, presence: true
  validates :year, presence: true, inclusion: { in: 1900..Date.today.year },
    format: {
      with: /(19|20)\d{2}/i,
      message: "should be a four-digit year"
    }


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
