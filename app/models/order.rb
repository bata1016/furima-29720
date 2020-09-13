class Order < ApplicationRecord
  # アソシエーション
  belongs_to :item
  belongs_to :user
  has_one    :shoppings
end
