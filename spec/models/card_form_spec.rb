require 'rails_helper'

RSpec.describe CardForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    product = FactoryBot.create(:product)
    @card_form = FactoryBot.build(:card_form, user_id: user.id, product_id: product.id)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@card_form).to be_valid
      end
      it 'user_idが空でなければ保存できる' do
        @card_form.user_id = 1
        expect(@card_form).to be_valid
      end
      it 'product_idが空でなければ保存できる' do
        @card_form.product_id = 1
        expect(@card_form).to be_valid
      end
      it '郵便番号が「3桁＋ハイフン＋4桁」の組み合わせであれば保存できる' do
        @card_form.post_code = '123-4560'
        expect(@card_form).to be_valid
      end
      it '都道府県が「---」以外かつ空でなければ保存できる' do
        @card_form.prefecture_id = 1
        expect(@card_form).to be_valid
      end
      it '市区町村が空でなければ保存できる' do
        @card_form.city = '横浜市'
        expect(@card_form).to be_valid
      end
      it '番地が空でなければ保存できる' do
        @card_form.address = '旭区１２３'
        expect(@card_form).to be_valid
      end
      it '建物名が空でも保存できる' do
        @card_form.building_name = nil
        expect(@card_form).to be_valid
      end
      it '電話番号が11番桁以内かつハイフンなしであれば保存できる' do
        @card_form.phone_number = 12_345_678_910
        expect(@card_form).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存できない' do
        @card_form.user_id = nil
        @card_form.valid?
        expect(@card_form.errors.full_messages).to include("User can't be blank")
      end
      it 'product_idが空だと保存できない' do
        @card_form.product_id = nil
        @card_form.valid?
        expect(@card_form.errors.full_messages).to include("Product can't be blank")
      end
      it '郵便番号が空だと保存できないこと' do
        @card_form.post_code = nil
        @card_form.valid?
        expect(@card_form.errors.full_messages).to include("Post code can't be blank", 'Post code is invalid. Include hyphen(-)')
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @card_form.post_code = 1_234_567
        @card_form.valid?
        expect(@card_form.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '都道府県が「---」だと保存できないこと' do
        @card_form.prefecture_id = 0
        @card_form.valid?
        expect(@card_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が空だと保存できないこと' do
        @card_form.prefecture_id = nil
        @card_form.valid?
        expect(@card_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @card_form.city = nil
        @card_form.valid?
        expect(@card_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @card_form.address = nil
        @card_form.valid?
        expect(@card_form.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @card_form.phone_number = nil
        @card_form.valid?
        expect(@card_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンがあると保存できないこと' do
        @card_form.phone_number = '123 - 1234 - 1234'
        @card_form.valid?
        expect(@card_form.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が12桁以上あると保存できないこと' do
        @card_form.phone_number = 12_345_678_910_123_111
        @card_form.valid?
        expect(@card_form.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が9桁以下では購入できないこと' do
        @card_form.phone_number = 123456789
        @card_form.valid?
        expect(@card_form.errors.full_messages).to include('Phone number is invalid')
      end
      it 'トークンが空だと保存できないこと' do
        @card_form.token = nil
        @card_form.valid?
        expect(@card_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end