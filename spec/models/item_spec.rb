require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/harunaddf.png')
  end

  describe '出品テスト' do
    context '1,出品登録成功' do
      it '1-1,全てしっかりと入力されていれば登録OK' do
        expect(@item).to be_valid
      end
    end

    context '2,出品登録失敗' do
      it '2-1,画像未登録' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '2-2,商品名空白' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '2-3,商品説明空白' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it '2-4,カテゴリー欄未選択("---"にカーソルが合っている)' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't select '---'")
      end
      it '2-5,商品状態欄未選択' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't select '---'")
      end
      it '2-6,配送料負担欄未選択' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't select '---'")
      end
      it '2-7,発送元地域欄未選択' do
        @item.delivery_source_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery source can't select '---'")
      end
      it '2-8,発送日数欄未選択' do
        @item.delivery_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery days can't select '---'")
      end
      it '2-9,販売価格空白' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '2-10,販売価格が指定された金額枠外' do
        @item.price = 1_234_567_890
        @item.valid?
        expect(@item.errors.full_messages).to include('Price within the range form 300 ~ 9,999,999')
      end
      it '2-11,販売価格欄に半角数字以外が入っている' do
        @item.price = 'test'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
