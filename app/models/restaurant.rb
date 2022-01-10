class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy # can call @restaurant.review
end
