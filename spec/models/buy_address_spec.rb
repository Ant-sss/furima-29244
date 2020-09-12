require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  before do
    @buy_address = FactoryBot.build(:buy_address)
  end

  describe '購入' do
    
    context '購入がうまくいくとき' do
      it '全ての値が正しく入力されているとき、保存できること' do
        expect(@buy_address).to be_valid
      end
      it '建物名が空でも保存できること' do
        @buy_address.building_name = nil
        expect(@buy_address).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it 'トークンが生成されなければ、保存できない' do
        @buy_address.token = ""
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空だと保存できない' do
        @buy_address.postal_code = ""
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンがないと保存できない' do
        @buy_address.postal_code = 1234567
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code is invalid")
      end
      it '郵便番号が正しくないと保存できない' do
        @buy_address.postal_code = 123-456
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code is invalid")
      end
      it '郵便番号が正しくないと保存できない' do
        @buy_address.postal_code = 12-4567
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code is invalid")
      end
      it '都道府県が選択されていないと保存できない' do
        @buy_address.prefecture_id = 1
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '市区町村が空だと保存できない' do
        @buy_address.city = ""
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できない' do
        @buy_address.house_num = ""
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("House num can't be blank")
      end
      it '電話番号が空だと保存できない' do
        @buy_address.phone_num = ""
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone num can't be blank")
      end
      it '電話番号が11桁以下だと保存できない' do
        @buy_address.phone_num = "0901234567"
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone num is invalid")
      end
      it '電話番号にハイフンがあると保存できない' do
        @buy_address.phone_num = "090-1234-56"
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone num is invalid")
      end
    end
  end

end
