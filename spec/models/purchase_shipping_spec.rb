require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:purchase_shipping, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe  '商品購入機能' do
    context '商品の購入ができるとき' do
      it 'すべての項目が入力されていれば購入できる' do
        expect(@order).to be_valid
      end
      it '建物が空でも保存できる' do
        @order.building = ''
        expect(@order).to be_valid  
      end
    end
    context '商品の購入ができないとき' do
      it '郵便番号が空では登録できない' do
        @order.postcode = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postcode can't be blank")
      end
      it '郵便番号が「000-0000」の形でなければ登録できない' do
        @order.postcode = 1_112_222
        @order.valid?
        expect(@order.errors.full_messages).to include('Postcode is invalid')
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
      it '電話番号が9文字以下では登録できない' do
        @order.tel = '000111122'
        @order.valid?
        expect(@order.errors.full_messages).to include('Tel is invalid')
      end
      it '電話番号が12文字以上では登録できない' do
        @order.tel = '000111122223'
        @order.valid?
        expect(@order.errors.full_messages).to include('Tel is invalid')
      end
      it '電話番号が全角では保存できない' do
        @order.tel = '０００１１１１２２２２'
        @order.valid?
        expect(@order.errors.full_messages).to include('Tel is invalid')
      end
      it 'tokenが空では登録できない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐づいていなければ購入できない' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていなければ購入できない' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
