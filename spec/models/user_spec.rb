require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Email is invalid'
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordが半角英数字混合でなければ登録できない' do
      @user.password = '1111111'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password には英字と数字の両方を含めて設定してください'
    end
    it '名字が空では登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name can't be blank"
    end
    it '名前が空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it '名字(カナ)が空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name kana can't be blank"
    end
    it '名前(カナ)が空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it '名字が全角でなければ登録できない' do
      @user.family_name = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Family name 全角文字を使用してください'
    end
    it '名前が全角でなければ登録できない' do
      @user.family_name = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name 全角文字を使用してください'
    end
    it '名字(カナ)が全角でなければ登録できない' do
      @user.family_name = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Family name kana 全角文字を使用してください'
    end
    it '名前(カナ)が全角でなければ登録できない' do
      @user.family_name = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name kana 全角文字を使用してください'
    end
    it '生年月日が空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  end
end
