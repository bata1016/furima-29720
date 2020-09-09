class Item < ApplicationRecord
  # バリデーション
  validates :name,              presence: true
  validates :price,             presence: true
  validates :description,       presence: true
  validates :category_id,       presence: true
  validates :delivery_fee_id,   presence: true
  validates :delivery_date_id,  presence: true
  validates :statement_id,      presence: true
  validates :prefecture_id,     presence: true



  # アソシエーション
  belongs_to :user
  has_one_attched :image
end
