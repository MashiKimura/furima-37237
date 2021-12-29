require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  before do
    @order = FactoryBot.build(:purchase_shipping)
  end

  describe  '商品購入機能' do
    context '商品の購入ができるとき' do
      it 'すべての項目が入力されていれば購入できる' do
      end
    end
    context '商品の購入ができないとき' do
      it '郵便番号が空では登録できない' do
        @order.postcode = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postcode can't be blank")
      end
      it '都道府県が空では登録できない' do
        @order.prefecture_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が「1」では登録できない' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空では登録できない' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では登録できない' do
        @order.street_address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Street address can't be blank")
      end
      it '電話番号が空では登録できない' do
        @order.tel = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Tel can't be blank")
      end
      it '' do
      end
      it '' do
      end
      it '' do
      end
      it '' do
      end
      it '' do
      end
      it '' do
      end

    end
  end
end
