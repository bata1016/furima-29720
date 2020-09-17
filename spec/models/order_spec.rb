require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_shopping = FactoryBot.build(:order_shopping, item_id: item.id ,user_id: user.id)
    sleep(2)
  end

  describe "商品購入" do
    it "商品が購入できる時" do
      expect(@order_shopping).to be_valid
     end
    it "建物名が空の時でも登録できること" do
      @order_shopping.building = ""
      expect(@order_shopping).to be_valid
    end
    it "トークンが必須であること" do
      @order_shopping.token = ""
      @order_shopping.valid?
      expect(@order_shopping.errors.full_messages).to include("Token can't be blank")
    end
    it "郵便番号が必須であること" do
      @order_shopping.postcode = ""
      @order_shopping.valid?
      expect(@order_shopping.errors.full_messages).to include("Postcode can't be blank")
    end
    it "郵便番号にハイフンが必須であること" do
      @order_shopping.postcode = "1231234"
      @order_shopping.valid?
      expect(@order_shopping.errors.full_messages).to include("Postcode input correctly")
    end
    it "電話番号が必須なこと" do
      @order_shopping.phone_number = ""
      @order_shopping.valid?
      expect(@order_shopping.errors.full_messages).to include("Phone number can't be blank")
    end
    it "電話番号は10桁または11桁出あること" do
      @order_shopping.phone_number = "123112212"
      @order_shopping.valid?
      expect(@order_shopping.errors.full_messages).to include("Phone number input correctly")
    end
    it "市区町村の情報が必須であること" do
      @order_shopping.city = ""
      @order_shopping.valid?
      expect(@order_shopping.errors.full_messages).to include("City can't be blank")
    end
    it "番地の情報が必須であること" do
      @order_shopping.block = ""
      @order_shopping.valid?
      expect(@order_shopping.errors.full_messages).to include("Block can't be blank")
    end
    it "都道府県が---では登録できないこと" do
      @order_shopping.prefecture_id = 1
      @order_shopping.valid?
      expect(@order_shopping.errors.full_messages).to include("Prefecture must be other than 1")
    end
  end
end
