class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :rating, :content
  has_one :movie, serializer: MovieSerializer
  has_one :user, serializer: UserSerializer
end
