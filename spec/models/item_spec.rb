require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'itemsの出品' do
    context 'itemsの出品ができる場合' do
      it '商品、説明、カテゴリー、商品の状態、配送の負担、配送元の地域、発送までの日数、価格が存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context 'itemsの出品ができない場合' do
      it '画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品が空では出品できない' do
        @item.item = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item can't be blank")
      end
      it '説明が空では出品できない' do
        @item.message = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Message can't be blank")
      end
      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it '商品の状態に「---」が選択されている場合は出品できない' do
        @item.situation_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Situation must be other than 1')
      end
      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @item.expense_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Expense must be other than 1')
      end
      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @item.until_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Until day must be other than 1')
      end
      it '価格が空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が¥300未満の場合は出品できない' do
        @item.price = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
      it '価格が¥10,000,000以上の場合は出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
      it '価格は半角数値以外では出品できない' do
        @item.price = '１２３４５'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
      it 'userが紐付いていない場合は登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
