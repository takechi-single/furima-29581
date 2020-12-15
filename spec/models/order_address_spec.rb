require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品配送先の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it '全ての値が正しく入力されていれば保存できること' do
      expect(@order_address).to be_valid
    end
    it '郵便番号が空だと保存できないこと' do
      @order_address.postal_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号にハイフンが含まれないと保存できないこと' do
      @order_address.postal_code = "kome"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it '都道府県は「"---"」を選択すると出品できないこと' do
      @order_address.shipping_area_id = 0
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Shipping area must be other than 0')
    end
    it '都道府県を選択しないと出品できないこと' do
      @order_address.shipping_area_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Shipping area is not a number')
    end
    it '市区町村が空だと保存できないこと' do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
    it '市区町村は半角文字だと保存できないこと' do
      @order_address.city = "ﾓｼﾞ"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City is invalid. Input full-width characters.")
    end
    it '番地が空だと保存できないこと' do
      @order_address.house_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("House number can't be blank")
    end
    it '番地は半角文字だと保存できないこと' do
      @order_address.house_number = "ﾓｼﾞ"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("House number is invalid. Input full-width characters.")
    end
    it '建物名が空でも保存できること' do
      @order_address.building_name = nil
      expect(@order_address).to be_valid
    end
    it '電話番号が空だと保存できないこと' do
      @order_address.phone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号に数字以外が入力されると保存できないこと' do
      @order_address.phone_number = "kome"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid. Input half-width characters")
    end
    it '電話番号に全角数字が入力されると保存できないこと' do
      @order_address.phone_number = '７００'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid. Input half-width characters")
    end
    it '電話番号はハイフンが不要で11桁以内でないと保存できないこと' do
      @order_address.phone_number = '000-000-000'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid. Input half-width characters")
    end
    it 'tokenが空では保存できないこと' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end
