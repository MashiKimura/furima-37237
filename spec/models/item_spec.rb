require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe  '商品出品機能' do
    context '商品の出品ができるとき' do
      it 'すべての項目が入力されていれば登録できる' do
        @item.valid?
        expect(@item).to be_valid
      end
    end
    context '商品の出品ができないとき' do
      it '画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリーが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'カテゴリーが「1」では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が空では登録できない' do
        @item.situation_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Situation can't be blank")
      end
      it '商品の状態が「1」では登録できない' do
        @item.situation_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Situation can't be blank")
      end
      it '配送料が空では登録できない' do
        @item.delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery can't be blank")
      end
      it '配送料が「1」では登録できない' do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery can't be blank")
      end
      it '発送元が空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送元が「1」では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数が空では登録できない' do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it '発送までの日数が「1」では登録できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it '価格が空では登録できない' do 
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が「300未満」では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it '価格が「9999999超」では登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it '価格が整数でなければ登録できない' do
        @item.price = @item.price + 0.31
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it '価格が半角でなければ登録できない' do
        @item.price = "１００００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it 'userと紐づいていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end

end
