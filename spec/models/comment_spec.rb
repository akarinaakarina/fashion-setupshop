require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿' do
    context 'コメント投稿できるとき' do
      it 'ユーザー、商品、テキストが存在すればコメント投稿できる' do
        expect(@comment).to be_valid
      end
    end
    context 'コメント投稿できないとき' do
      it 'ユーザーが空ではコメント投稿できない' do
        @comment.user_id = 0
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Userを入力してください")
      end
      it '商品が空ではコメント投稿できない' do
        @comment.original_item_id = 0
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Original itemを入力してください")
      end
      it 'テキストが空ではコメント投稿できない' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Textを入力してください")
      end
    end
  end
end