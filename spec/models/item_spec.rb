require 'rails_helper'

RSpec.describe Item, type: :model do
  before do 
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end
  
  describe '出品' do

    context '出品がうまく行くとき' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it '画像が選択されていないと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("出品画像を入力してください")
      end
      it '商品名が空だと保存できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it '商品説明が空だと保存できない' do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'カテゴリー情報が選択されていないと保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end
      it '商品状態が選択されていないと保存できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
      end
      it '配送料負担が選択されていないと保存できない' do
        @item.deliveryfee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
      end
      it '発送元が選択されていないと保存できない' do
        @item.shipfrom_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
      end
      it '発送までの日数が選択されていないと保存できない' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
      end
      it '価格が空だと保存できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end
      it '価格が300円以下だと保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は300円以上にしてください")
      end
      it '価格が9,999,999円以上だと保存できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は9999999円以下にしてください")
      end
      it '価格の数字が全角だと保存できない' do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は半角数字で入力してください")
      end
    end
  end

end
