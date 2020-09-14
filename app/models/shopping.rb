class Shopping < ApplicationRecord
  # バリデーション
  validates :postcode,      presence: true
  validates :city,          presence: true
  validates :block,         presence: true
  validates :building
  validates :phone_number,  presence: true
  validates :prefecture_id, presence: true
  validates :order_id,      presence: true

  # アソシエーション
  belongs_to :order
end
