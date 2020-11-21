require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品情報の入力' do
    it 'すべての値が正しく入力できれば出品できること' do
      @item.valid?
      expect(@item).to be_valid
    end
  end
end
