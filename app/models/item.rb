class Item < ApplicationRecord
  # バリデーション
  validates :name,              presence: true
  validates :price,             presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :image,             presence: true
  validates :description,       presence: true


  with_options presence: true, numericality: { other_than: 1 }  do
    validates :category_id    
    validates :delivery_fee_id
    validates :delivery_date_id
    validates :statement_id   
    validates :prefecture_id  
  end

  # アソシエーション
  belongs_to :user
  has_one_attached  :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_date
  belongs_to_active_hash :category
  belongs_to_active_hash :statement
  belongs_to_active_hash :prefecture
end
