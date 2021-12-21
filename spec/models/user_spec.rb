require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録ができるとき' do
      it "全ての項目が入力されていれば登録できる" do
      end
    end
    context '新規登録できないとき' do
      it "nicknameが空だと登録できない" do
      end
      it "emailが空では登録できない" do
      end
      it "emailが重複していると登録できない" do
      end
      it "emailに@が含んでいないと登録できない" do
      end
      it "passwordが空では登録できない" do
      end
      it "passwordは6文字以上でなければ登録できない" do
      end
      it "passwordが半角英数字混合でなければ登録できない" do
      end
      it "passwordとpassword_confirmationが一致していないと登録できない" do
      end
      it "last_nameが空では登録できない" do
      end
      it "first_nameが空では登録できない" do
      end
      it "last_name_rubyが空では登録できない" do
      end
      it "first_name_rubyが空では登録できない" do
      end
      it "last_nameは全角(漢字・ひらがな・カタカナ)でなければ登録できない" do
      end
      it "first_nameは全角(漢字・ひらがな・カタカナ)でなければ登録できない" do
      end
      it "nameが空では登録できない" do
      end
      it "nameが空では登録できない" do
      end
      it "last_nameは全角(カタカナ)でなければ登録できない" do
      end
      it "first_nameは全角(カタカナ)でなければ登録できない" do
      end
      it "birth_dayが空では登録できない" do
      end
    end
  end
end
