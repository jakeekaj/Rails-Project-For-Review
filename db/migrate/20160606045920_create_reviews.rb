class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :rating
      t.integer :user_id
      t.integer :movie_id

      t.timestamps null: false
    end
  end
end
