class OrderShopping
  include ActiveModel::Model
  attr_accessor :user_id, :postcode, :city, :block, :building, :phone_number,:prefecture_id, :item_id, :token

  # バリデーション
  with_options presence: true do
    validates :postcode,      format: { with: /\A\d{3}[-]\d{4}\z/,  message: "input correctly" }
    validates :phone_number,  format: { with: /\A\d{11}\z/, message: "input correctly"}
  end
  validates :city,          presence: true
  validates :block,         presence: true
  validates :prefecture_id, presence: true
  validates :token,         presence: true

  def save
    order = Order.create!(user_id: user_id, item_id: item_id)
    Shopping.create!(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)
  end
end