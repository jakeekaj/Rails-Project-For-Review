class UserSerializer < ActiveModel::Serializer
  attributes :id, :email
  has_many :movies, serializer: MovieSerializer
  has_many :reviews, serializer: ReviewSerializer
end
