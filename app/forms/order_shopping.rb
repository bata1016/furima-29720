class OrderShopping
  include ActiveModel::Model
  attr_accessor :user_id, :postcode, :city, :block, :building, :phone_number,:prefecture_id, :item_id, :token

  POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/
  # バリデーション
  with_options presence: true do
    validates :postcode,      format: { with: POSTAL_CODE_REGEX,  message: "input correctly" }
    validates :phone_number,  format: { with: /\A\d{10,11}\z/, message: "input correctly"}
  end

  with_options presence: true do
    validates :city        
    validates :block       
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :token       
  end
  

  def save
    order = Order.create!(user_id: user_id, item_id: item_id)
    Shopping.create!(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)
  end
end