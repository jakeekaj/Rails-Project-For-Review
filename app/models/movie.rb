class Movie < ActiveRecord::Base
  belongs_to  :user
  has_many    :reviews, dependent: :destroy
  has_many    :reviewers, through: :reviews
  has_many    :quotes

  validates :title,
            :synopsis, presence: true

  validates :year, presence: true, inclusion: { in: 1900..Date.today.year },
    format: {
      with: /(19|20)\d{2}/i,
      message: 'should be a four-digit year'
    }

  accepts_nested_attributes_for :reviews, reject_if: :all_blank

  scope :sorted_by_rating,  -> { order(rating: :desc) }
  scope :sorted_by_year,    -> { order(year: :desc) }

  scope :rateds,  -> { where.not(rating: nil) }
  scope :unrated, -> { where(rating: nil) }

  def update_rating
    return if reviews.empty?
    ratings = reviews.pluck(:rating).compact
    update_attributes(rating: (ratings.sum / ratings.size.to_f))
  end
end
