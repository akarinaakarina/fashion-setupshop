require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @like = FactoryBot.build(:like)
  end

  describe 'お気に入り登録' do
    context 'お気に入り登録できるとき' do
      it 'ユーザーと商品が存在すればお気に入り登録できる' do
        expect(@like).to be_valid
      end
    end
    context 'お気に入り登録できないとき' do
      it 'ユーザーが空ではお気に入り登録できない' do
        @like.user_id = 0
        @like.valid?
        expect(@like.errors.full_messages).to include("Userを入力してください")
      end
      it '商品が空ではお気に入り登録できない' do
        @like.original_item_id = 0
        @like.valid?
        expect(@like.errors.full_messages).to include("Original itemを入力してください")
      end
    end
  end
end