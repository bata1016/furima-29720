class Item < ApplicationRecord
  # バリデーション
  validates :name,              presence: true
  validates :price,             presence: true
  validates :description,       presence: true, numericality: { other_than: 1 }
  validates :category_id,       presence: true, numericality: { other_than: 1 }
  validates :delivery_fee_id,   presence: true, numericality: { other_than: 1 }
  validates :delivery_date_id,  presence: true, numericality: { other_than: 1 }
  validates :statement_id,      presence: true, numericality: { other_than: 1 }
  validates :prefecture_id,     presence: true, numericality: { other_than: 1 }

  # アソシエーション
  belongs_to       :user
  has_one_attched  :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :delivery_fee, :delivery_date, :category, :statement, :prefecture
end
