require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録テスト' do
    context '1,新規登録成功' do
      it '1-1,全てしっかりと入力されていれば登録OK' do
        expect(@user).to be_valid
      end
    end

    context '2,新規登録失敗' do
      it '2-1,ニックネーム空白' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it '2-2,メールアドレス空白' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '2-3,メールアドレス重複登録' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it '2-4,メールアドレス「@」がない' do
        @user.email = 'red_force'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '2-5,パスワード空白' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it '2-6,パスワード5文字以下' do
        @user.password = 'on624'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it '2-7,英数混合でない' do
        @user.password = 'ongeki'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it '2-8,確認用パスワード空白' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '2-9,パスワード・確認用パスワードの不一致' do
        @user.password_confirmation = 'ogenki0624'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '2-10,苗字空白' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it '2-11,名前空白' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it '2-12,苗字(カナ)空白' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it '2-13,名前(カナ)空白' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it '2-14,苗字がアルファベッド登録' do
        @user.first_name = 'sakurai'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it '2-15,名前がアルファベット登録' do
        @user.last_name = 'haruna'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it '2-16,苗字(カナ)がカタカナ以外(ひらがなだった)' do
        @user.first_name_kana = 'さくらい'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      it '2-17,名前(カナ)がカタカナ以外(ひらがなだった)' do
        @user.last_name_kana = 'はるな'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end
      it '2-18,生年月日空白' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
