class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :rating, :synopsis, :year
  has_one :user, serializer: UserSerializer
  has_many :reviews, serializer: ReviewSerializer
  has_many :quotes
end
