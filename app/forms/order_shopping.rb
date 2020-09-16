class OrderShopping
  include ActiveModel::Model
  attr_accessor :user_id, :postcode, :city, :block, :building, :phone_number,:prefecture_id, :item_id, :token

  # バリデーション
  validates :postcode,      presence: true
  validates :city,          presence: true
  validates :block,         presence: true
  validates :phone_number,  presence: true
  validates :prefecture_id, presence: true

  def save
    order = Order.create!(user_id: user_id, item_id: item_id)
    Shopping.create!(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)
  end
end