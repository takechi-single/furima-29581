require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品情報の入力' do
    it 'すべての値が正しく入力できれば出品できること' do
      @item.valid?
      expect(@item).to be_valid
    end
    it '出品画像を選択しなければ出品できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名を入力しなければ出品できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の説明を入力しなければ出品できないこと' do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status is not a number")
    end
    it 'カテゴリーを選択しなければ出品できないこと' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category is not a number")
    end
    it '配送料の負担を選択しなければ出品できないこと' do
      @item.shipping_charge_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charge is not a number")
    end
    it '発送元の地域を選択しなければ出品できないこと' do
      @item.shipping_area_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area is not a number")
    end
    it '発送までの日数を選択しなければ出品できないこと' do
      @item.shipping_date_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping date is not a number")
    end
    it '販売価格を入力しなければ出品できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '販売価格は（¥300~¥9,999,999）の間でなければ出品できないこと' do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end
    it '販売価格は半角数字のみ出品可能であること' do
      @item.price = 'koko'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
    end
  end
end
