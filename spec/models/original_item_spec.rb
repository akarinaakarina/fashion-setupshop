require 'rails_helper'

RSpec.describe OriginalItem, type: :model do
  before do
    @original_item = FactoryBot.build(:original_item)
  end

  describe '商品出品' do
    context '商品出品できるとき' do
      it '出品画像、商品名、商品の説明、商品形態、カテゴリー1、カテゴリー2、カラー、サイズ、配送料の負担、配送元の地域、発送までの日数、販売価格が存在すれば出品できる' do
        expect(@original_item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it '商品名が空では商品出品できない' do
        @original_item.name = ''
        @original_item.valid?
        expect(@original_item.errors.full_messages).to include("商品名を入力してください")
      end
      it '商品の説明が空では商品出品できない' do
        @original_item.description = ''
        @original_item.valid?
        expect(@original_item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it '商品形態についての情報が空では商品出品できない' do
        @original_item.state_id = 1
        @original_item.valid?
        expect(@original_item.errors.full_messages).to include('商品形態を選択してください')
      end
      it 'カテゴリー1の情報が空では商品出品できない' do
        @original_item.category1_id = 1
        @original_item.valid?
        expect(@original_item.errors.full_messages).to include('カテゴリー1を選択してください')
      end
      it 'カテゴリー2の情報が空では商品出品できない' do
        @original_item.category2_id = 1
        @original_item.valid?
        expect(@original_item.errors.full_messages).to include('カテゴリー2を選択してください')
      end
      it 'カラーの情報が空では商品出品できない' do
        @original_item.color_id = 1
        @original_item.valid?
        expect(@original_item.errors.full_messages).to include('カラーを選択してください')
      end
      it 'サイズの情報が空では商品出品できない' do
        @original_item.size_id = 1
        @original_item.valid?
        expect(@original_item.errors.full_messages).to include('サイズを選択してください')
      end
      it '配送料の負担についての情報が空では商品出品できない' do
        @original_item.delivery_style_id = 1
        @original_item.valid?
        expect(@original_item.errors.full_messages).to include('配送料の負担を選択してください')
      end
      it '発送元の地域についての情報が空では商品出品できない' do
        @original_item.prefecture_id = 1
        @original_item.valid?
        expect(@original_item.errors.full_messages).to include('配送元の地域を選択してください')
      end
      it '発送までの日数についての情報が空では商品出品できない' do
        @original_item.delivery_day_id = 1
        @original_item.valid?
        expect(@original_item.errors.full_messages).to include('発送までの日数を選択してください')
      end
      it '販売価格が空では商品出品できない' do
        @original_item.price = ''
        @original_item.valid?
        expect(@original_item.errors.full_messages).to include("販売価格を入力してください")
      end
      it '販売価格が¥300未満では商品出品できない' do
        @original_item.price = 100
        @original_item.valid?
        expect(@original_item.errors.full_messages).to include('販売価格の制限内で設定してください')
      end
      it '販売価格が¥10,000,000以上では商品出品できない' do
        @original_item.price = 10_000_000
        @original_item.valid?
        expect(@original_item.errors.full_messages).to include('販売価格の制限内で設定してください')
      end
      it '販売価格が全角数字では商品出品できない' do
        @original_item.price = '１０００'
        @original_item.valid?
        expect(@original_item.errors.full_messages).to include('販売価格には半角数字での入力をしてください')
      end
      it '販売価格が半角英数混合では商品出品できない' do
        @original_item.price = '1000a'
        @original_item.valid?
        expect(@original_item.errors.full_messages).to include('販売価格には半角数字での入力をしてください')
      end
      it '販売価格が半角英語だけでは商品出品できない' do
        @original_item.price = '1000a'
        @original_item.valid?
        expect(@original_item.errors.full_messages).to include('販売価格には半角数字での入力をしてください')
      end
      it '出品画像が空では商品出品できない' do
        @original_item.image = nil
        @original_item.valid?
        expect(@original_item.errors.full_messages).to include("出品画像を選択してください")
      end
    end
  end
end
