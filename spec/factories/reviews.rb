FactoryGirl.define do
  factory :review do
    content "MyText"
    rating 1
    user_id 1
    movie_id 1
  end
end
