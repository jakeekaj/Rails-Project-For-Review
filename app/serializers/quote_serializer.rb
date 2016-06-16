class QuoteSerializer < ActiveModel::Serializer
  attributes :id, :text, :movie_id
  has_one :movie, serializer: MovieSerializer
end
