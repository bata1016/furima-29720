class Order < ApplicationRecord
  attr_accessor :token
  # バリデーション
  validates :token, presence: true
  # アソシエーション
  belongs_to :item
  belongs_to :user
  has_one    :shoppings
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
