require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('spec/images/test.jpeg')
  end
  describe '出品機能' do
    it '商品名、金額、商品説明、カテゴリー、配達手数料、配送日、出荷元地域、商品状態、商品写真があれば出品できる' do
      expect(@item).to be_valid
    end
    it '商品名が必須のこと' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の説明が必須のこと' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'カテゴリーの情報が必須のこと' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it '---では出品できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end
    it '商品の状態についての情報が必須のこと' do
      @item.statement_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Statement can't be blank")
    end
    it '---では出品できないこと' do
      @item.statement_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Statement must be other than 1')
    end
    it '配送料の負担についての情報が必須のこと' do
      @item.delivery_fee_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
    end
    it '---では出品できないこと' do
      @item.delivery_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery fee must be other than 1')
    end
    it '発送元の地域についての情報が必須であること' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '---では出品できないこと' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
    end
    it '発送までの日数についての情報が必須であること' do
      @item.delivery_date_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery date can't be blank")
    end
    it '---では出品できないこと' do
      @item.delivery_date_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery date must be other than 1')
    end
    it '価格についての情報が必須であること' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '価格が数字でないと出品できないこと' do
      @item.price = 'oooo'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
    it '価格が¥300より下だと登録できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it '価格が¥9,999,999より上だと登録できないこと ' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
    it '画像が添付されていないと登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
  end
end
