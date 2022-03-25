require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  context '新規登録がうまくかないとき' do
    it 'ニックネームが空欄だと保存できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'メールアドレスが空欄だと保存できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'メールアドレスがすでに登録しているユーザーと重複していると保存できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'パスワードが空欄だと保存できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワード（確認含む）が5文字以下だと保存できない' do
      @user.password = 'aaa1'
      @user.password_confirmation = 'aaa1'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'パスワード（確認含む）が半角英数字でないと保存できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
    end
    it 'パスワード（確認）が空欄だと保存できない' do
      @user.password = '123abc'
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '名字が全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.family_name = 'hoge'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name is invalid')
    end
    it '名前が全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.first_name = 'hoge'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end
    it '名字のフリガナが全角（カタカナ）でないと登録できない' do
      @user.family_name_kana = 'ほげ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name kana is invalid')
    end
    it '名前のフリガナが全角（カタカナ）でないと登録できない' do
      @user.first_name_kana = 'ほげ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end
    it '生年月日が空欄だと保存できない' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
end