class Item < ApplicationRecord
  # バリデーション
  validates :name,              presence: true
  validates :price,             presence: true
  validates :image,             presence: true
  validates :description,       presence: true
  validates :category_id,       presence: true, numericality: { other_than: 1 }
  validates :delivery_fee_id,   presence: true, numericality: { other_than: 1 }
  validates :delivery_date_id,  presence: true, numericality: { other_than: 1 }
  validates :statement_id,      presence: true, numericality: { other_than: 1 }
  validates :prefecture_id,     presence: true, numericality: { other_than: 1 }

  # アソシエーション
  belongs_to       :user
  has_one_attached  :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_date
  belongs_to_active_hash :category
  belongs_to_active_hash :statement
  belongs_to_active_hash :prefecture
end
