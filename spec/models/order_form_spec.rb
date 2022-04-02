require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_form).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存できない' do
        @order_form.user_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @order_form.item_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと保存できないこと' do
        @order_form.post_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code can't be blank", 'Post code is invalid. Include hyphen(-)')
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @order_form.post_code = 1_234_567
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '都道府県が空だと保存できないこと' do
        @order_form.prefecture_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @order_form.address = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @order_form.tel = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Tel can't be blank")
      end
      it '電話番号にハイフンがあると保存できないこと' do
        @order_form.tel = '123 - 1234 - 1234'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Tel is invalid')
      end
      it '電話番号が12桁以上あると保存できないこと' do
        @order_form.tel = 12_345_678_910_123_111
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Tel is invalid')
      end
      it 'トークンが空だと保存できないこと' do
        @order_form.token = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
