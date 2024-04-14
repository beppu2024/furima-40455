require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    
  end

  describe 'itemsの保存' do
    context 'itemsの保存ができる場合' do
      it '商品、説明、カテゴリー、商品の状態、配送の負担、配送元の地域、発送までの日数、価格が存在すれば保存できる'do
        expect(@item).to be_valid
      end
    end
    context 'itemsの保存ができない場合' do
      it '画像が空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品が空では保存できない' do
        @item.item = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item can't be blank")
      end
      it '説明が空では保存できない' do
        @item.message = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Message can't be blank")
      end
      it 'カテゴリーが空では保存できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it '商品の状態が空では保存できない' do
        @item.situation_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Situation is not a number")
      end
      it '配送の負担が空では保存できない' do
        @item.expense_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Expense is not a number")
      end
      it '配送元の地域が空では保存できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is not a number")
      end
      it '配送までの日数が空では保存できない' do
        @item.until_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Until day is not a number")
      end
      it '価格が空では保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格は、¥300~¥9,999,999の間以外では保存できない' do
        @item.price = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it '価格は半角数値以外では保存できない' do
        @item.price = '１２３４５'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
    end
  end
end