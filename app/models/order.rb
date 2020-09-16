class Order < ApplicationRecord
  # アソシエーション
  belongs_to :item
  belongs_to :user
  has_one    :shoppings

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
