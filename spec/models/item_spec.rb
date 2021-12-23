require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @Item = FactoryBot.build(:item)
  end

  describe  '商品出品機能' do
    context '商品の出品ができるとき' do
      it 'すべての項目が入力されていれば登録できる' do
      end
    end
    context '商品の出品ができないとき' do
      it '画像が空では登録できない' do
      end
      it '商品名が空では登録できない' do
      end
      it '商品の説明が空では登録できない' do
      end
      it 'カテゴリーが空では登録できない' do
      end
      it 'カテゴリーが「1」では登録できない' do
      end
      it '商品の状態が空では登録できない' do
      end
      it '商品の状態が「1」では登録できない' do
      end
      it '配送料が空では登録できない' do
      end
      it '配送料が「1」では登録できない' do
      end
      it '発送元が空では登録できない' do
      end
      it '発送元が「1」では登録できない' do
      end
      it '発送までの日数が空では登録できない' do
      end
      it '発送までの日数が「1」では登録できない' do
      end
      it '価格が空では登録できない' do 
      end
      it '価格が「300未満」では登録できない' do
      end
      it '価格が「9999999超」では登録できない' do
      end
      it '価格が整数でなければ登録できない' do
      end
      it '価格が半角でなければ登録できない' do
      end
      it '価格が入力されたら販売手数料が変動する' do
      end
      it '価格が入力されたら販売利益が変動する' do
      end
    end
  end

end
