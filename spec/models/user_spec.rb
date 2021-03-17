require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'プロフィール画像、ニックネーム、ショップネーム、お店のコンセプト、メールアドレス、パスワード、パスワード(確認)、苗字、名前、苗字(カナ)、名前(カナ)、生年月日が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'パスワードとパスワード(確認)は半角英数字混合で6文字以上であれば登録できる' do
        @user.password = 'aaaa11'
        @user.password_confirmation = 'aaaa11'
        expect(@user).to be_valid
      end
      it 'ショップネームが抜けていても登録できる' do
        @user.shop_name = ''
        expect(@user).to be_valid
      end
      it 'お店のコンセプトが抜けていても登録できる' do
        @user.description = ''
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'プロフィール画像が空では登録できない' do
        @user.image = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("プロフィール画像を選択してください")
      end
      it 'ニックネームが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'Eメールが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it '苗字が空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください")
      end
      it '名前が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it '苗字(カナ)が空では登録できない' do
        @user.last_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字（カナ）を入力してください", "苗字（カナ）には全角（カタカナ）での入力をしてください")
      end
      it '名前(カナ)が空では登録できない' do
        @user.first_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カナ）を入力してください", "名前（カナ）には全角（カタカナ）での入力をしてください")
      end
      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
      it 'パスワードが存在してもパスワード(確認)が空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it '重複したEメールが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'Eメールは@を含まないと登録できない' do
        @user.email = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'パスワードが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください', 'パスワードには半角英数字混合での入力をしてください')
      end
      it 'パスワードは半角英字だけでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには半角英数字混合での入力をしてください')
      end
      it 'パスワードは半角数字だけでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには半角英数字混合での入力をしてください')
      end
      it 'パスワードは全角では登録できない' do
        @user.password = 'aaaa１１'
        @user.password_confirmation = 'aaaa１１'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには半角英数字混合での入力をしてください')
      end
      it 'ユーザー本名(苗字)は、全角（漢字・ひらがな・カタカナ）の入力でないと登録できない' do
        @user.last_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字には全角（漢字・ひらがな・カタカナ）での入力をしてください')
      end
      it 'ユーザー本名(名前)は、全角（漢字・ひらがな・カタカナ）の入力でないと登録できない' do
        @user.first_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前には全角（漢字・ひらがな・カタカナ）での入力をしてください')
      end
      it 'ユーザー本名(苗字)のフリガナは、全角（カタカナ）の入力でないと登録できない' do
        @user.last_kana = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字（カナ）には全角（カタカナ）での入力をしてください')
      end
      it 'ユーザー本名(名前)のフリガナは、全角（カタカナ）の入力でないと登録できない' do
        @user.first_kana = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（カナ）には全角（カタカナ）での入力をしてください')
      end
    end
  end
end
