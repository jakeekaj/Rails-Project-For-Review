class Quote < ActiveRecord::Base
  belongs_to  :movie
  validates   :text, presence: true
end
