class QuoteSerializer < ActiveModel::Serializer
  attributes :id, :text, :movie_id
end
