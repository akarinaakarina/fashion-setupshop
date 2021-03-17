require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  before do
    @buy_address = FactoryBot.build(:buy_address, user_id: 1, original_item_id: 1)
  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it 'クレジットカード情報、郵便番号、市区町村、番地、電話番号、都道府県があれば商品購入できる' do
        expect(@buy_address).to be_valid
      end
      it '建物名が抜けていても商品購入できる' do
        @buy_address.building_name = ''
        expect(@buy_address).to be_valid
      end
    end
    context '商品出品できないとき' do
      it 'クレジットカード情報が空では商品出品できない' do
        @buy_address.token = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it '郵便番号が空では商品出品できない' do
        @buy_address.postal_code = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it '郵便番号はハイフンがないと商品出品できない' do
        @buy_address.postal_code = '123exit4567'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('郵便番号の登録にはハイフンが必要です')
      end
      it '都道府県が空では商品出品できない' do
        @buy_address.prefecture_id = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('都道府県を選択してください')
      end
      it '市区町村が空では商品出品できない' do
        @buy_address.municipality = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("市区町村を入力してください")
      end
      it '番地が空では商品出品できない' do
        @buy_address.address = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("番地を入力してください")
      end
      it '電話番号が空では商品出品できない' do
        @buy_address.phone_number = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it '電話番号は11桁以内でないと商品出品できない' do
        @buy_address.phone_number = '090123456789'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('電話番号の登録には11桁以内の半角数字のみです')
      end
      it '電話番号は半角数字のみでないと商品出品できない' do
        @buy_address.phone_number = '０９０１２３４５６７８'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('電話番号の登録には11桁以内の半角数字のみです')
      end
      it 'user_idが空では商品出品できない' do
        @buy_address.user_id = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Userを入力してください")
      end
      it 'item_idが空では商品出品できない' do
        @buy_address.original_item_id = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Original itemを入力してください")
      end
    end
  end
end
