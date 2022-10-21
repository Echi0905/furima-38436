require 'rails_helper'
RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.create(:product)
    sleep(1)
  end

  describe '商品の出品登録' do
    context '出品登録ができるとき' do
      it '全ての入力事項が、存在すれば登録できる' do
        expect(@product).to be_valid
      end
      it 'カテゴリーが「---」以外であれば登録できる' do
        @product.category_id = 1
        expect(@product).to be_valid
      end
      it '商品の状態が「---」以外であれば登録できる' do
        @product.status_id = 1
        expect(@product).to be_valid
      end
      it '配送料の負担が「---」以外であれば登録できる' do
        @product.shipping_cost_id = 1
        expect(@product).to be_valid
      end
      it '発送元の地域が「---」以外であれば登録できる' do
        @product.prefecture_id = 1
        expect(@product).to be_valid
      end
      it '発送までの日数が「---」以外であれば登録できる' do
        @product.shipping_day_id = 1
        expect(@product).to be_valid
      end
      it '価格が半角数字でかつ300円〜9,999,999円であれば登録できる' do
        @product.price = 300
        expect(@product).to be_valid
      end
    end

    context '出品ができないとき' do
      it 'ユーザー登録している人でないと出品できない' do
        @product.user_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('Userを入力してください')
      end
      it '１枚画像がないと出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("画像を入力してください")
      end
      it '商品名が空欄だと出品できない' do
        @product.name = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("商品名を入力してください")
      end
      it '商品の説明が空欄だと出品できない' do
        @product.description = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'カテゴリーの情報が「---」だと出品できない' do
        @product.category_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include('カテゴリーは0以外の値にしてください')
      end
      it 'カテゴリーの情報が空欄だと出品できない' do
        @product.category_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("カテゴリーを入力してください", "カテゴリーは数値で入力してください")
      end
      it '商品の状態の情報が「---」だと出品できない' do
        @product.status_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include('商品の状態は0以外の値にしてください')
      end
      it '商品の状態の情報が空欄だと出品できない' do
        @product.status_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("商品の状態を入力してください", "商品の状態は数値で入力してください")
      end
      it '配送料の負担の情報が「---」だと出品できない' do
        @product.shipping_cost_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("配送料の負担は0以外の値にしてください")
      end
      it '配送料の負担の情報が空欄だと出品できない' do
        @product.shipping_cost_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("配送料の負担を入力してください", "配送料の負担は数値で入力してください")
      end
      it '発送元の地域の情報が「---」だと出品できない' do
        @product.prefecture_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("発送元の地域は0以外の値にしてください")
      end
      it '発送元の地域の情報が空欄だと出品できない' do
        @product.prefecture_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("発送元の地域を入力してください", "発送元の地域は数値で入力してください")
      end
      it '発送までの日数の情報が「---」だと出品できない' do
        @product.shipping_day_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("発送までの日数は0以外の値にしてください")
      end
      it '発送までの日数の情報が空欄だと出品できない' do
        @product.shipping_day_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("発送までの日数を入力してください", "発送までの日数は数値で入力してください")
      end

      it '価格が空欄だと出品できない' do
        @product.price = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("販売価格は数値で入力してください")
      end

      it '価格の範囲が、300円未満だと出品できない' do
        @product.price = 100
        @product.valid?
        expect(@product.errors.full_messages).to include("販売価格は300以上の値にしてください")
      end

      it '価格の範囲が、9,999,999円を超えると出品できない' do
        @product.price = 10_000_000
        @product.valid?
        expect(@product.errors.full_messages).to include("販売価格は9999999以下の値にしてください")
      end
      it '半角数字以外の値が含まれている場合は保存できないこと' do
        @product.price = 'ABC'
        @product.valid?
        expect(@product.errors.full_messages).to include("販売価格は数値で入力してください")
      end
    end
  end
end
