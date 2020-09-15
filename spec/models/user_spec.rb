require 'rails_helper'

RSpec.describe User, type: :model do

    before do
      @user = FactoryBot.build(:user)
    end
  describe '新規登録' do
    context '新規登録がうまくいく時' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it 'ニックネームが空だと保存できないこと' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'メールアドレスが空だと保存できないこと' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'メールアドレスに@がないと保存できないこと' do
        @user.email = "a"
        @user.valid?
      end
      it '重複したメールアドレスが存在する場合は登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'パスワードが空だと保存できないこと' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'パスワードが6文字以下だと保存できないこと' do
        @user.password = "aa000"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'パスワードが半角英数字混合でないと保存できないこと' do
        @user.password = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードが正しくありません")
      end
      it 'パスワードが存在しても確認用が空だと保存できないこと' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'ユーザー本名の苗字が空だと保存できないこと' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください")
      end
      it 'ユーザー本名の名前が空だと保存できないこと' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it 'ユーザー本名の苗字が半角だと保存できないこと' do
        @user.last_name = "a"
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字が正しくありません")
      end
      it 'ユーザー本名の名前が半角だと保存できないこと' do
        @user.first_name = "a"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前が正しくありません")
      end
      it 'ユーザー本名の苗字のフリガナが空だと保存できないこと' do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字（フリガナ）を入力してください")
      end
      it 'ユーザー本名の名前のフリガナが空だと保存できないこと' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（フリガナ）を入力してください")
      end
      it 'ユーザー本名の苗字のフリガナが半角だと保存できないこと' do
        @user.last_name_kana = "ﾔﾏﾀﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字（フリガナ）が正しくありません")
      end
      it 'ユーザー本名の名前のフリガナが半角だと保存できないこと' do
        @user.first_name_kana = "ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（フリガナ）が正しくありません")
      end
      it 'ユーザー本名の苗字のフリガナがカタカナでないと保存できないこと' do
        @user.last_name_kana = "やまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字（フリガナ）が正しくありません")
      end
      it 'ユーザー本名の名前のフリガナがカタカナでないと保存できないこと' do
        @user.first_name_kana = "たろう"
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（フリガナ）が正しくありません")
      end
      it '生年月日が空だと保存できないこと' do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end


  end
end
