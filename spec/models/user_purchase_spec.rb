require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase = FactoryBot.build(:user_purchase, user_id: user.id, item_id: item.id)
  end

  describe '商品購入テスト' do
    context '1,購入成功' do
      it '1-1,全てしっかりと入力されていれば購入OK' do
        expect(@purchase).to be_valid
      end

      it '1-2,建物名が空白でも購入できる' do
        @purchase.build_name = ''
        expect(@purchase).to be_valid
      end
    end

    context '2,購入失敗' do
      it '2-1,トークン空白' do
        @purchase.token = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end

      it '2-2,郵便番号空白' do
        @purchase.postal_code = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code can't be blank")
      end

      it '2-3,郵便番号「-」入れ忘れ' do
        @purchase.postal_code = '6120214'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Postal code is invalid')
      end

      it '2-4,都道府県未選択' do
        @purchase.prefecuture_id = 1
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Prefecuture can't select '---'")
      end

      it '2-5,市区町村空白' do
        @purchase.city = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("City can't be blank")
      end

      it '2-6,番地空白' do
        @purchase.address = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Address can't be blank")
      end

      it '2-7,電話番号空白' do
        @purchase.tel = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Tel can't be blank")
      end

      it '2-8,電話番号12桁以上' do
        @purchase.tel = 123_456_789_012
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Tel is too long (maximum is 11 characters)')
      end
    end
  end
end
