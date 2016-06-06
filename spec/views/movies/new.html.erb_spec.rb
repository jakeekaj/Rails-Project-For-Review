require 'rails_helper'

RSpec.describe "movies/new", type: :view do
  before(:each) do
    assign(:movie, Movie.new(
      :title => "MyString",
      :year => 1,
      :synopsis => "MyText",
      :rating => 1.5
    ))
  end

  it "renders new movie form" do
    render

    assert_select "form[action=?][method=?]", movies_path, "post" do

      assert_select "input#movie_title[name=?]", "movie[title]"

      assert_select "input#movie_year[name=?]", "movie[year]"

      assert_select "textarea#movie_synopsis[name=?]", "movie[synopsis]"

      assert_select "input#movie_rating[name=?]", "movie[rating]"
    end
  end
end
