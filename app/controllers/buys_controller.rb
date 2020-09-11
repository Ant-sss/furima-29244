class BuysController < ApplicationController
  before_action :set_item, only: [:index, :create]
  
  def index
    @buy = Buy.new
    # @item = Item.find(params[:item_id]) # 車のおもちゃを取得
    @address = Address.new
  end

  def create # @itemが空になっているので再度@itemを定義してあげる
    # @item = Item.find(params[:item_id]) # 車のおもちゃを取得
    @address = Address.new(address_params)
    if @address.save
      pay_item
      redirect_to root_path
    else
      render "index"
    end
  end

  private

  def address_params
    params.permit(:postal_code, :prefecture_id, :city, :building_name, :phone_num)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def buy_params
    params.permit(:token)
  end

  def pay_item
    Payjp.api_key = "sk_test_ff136e8748e55e57632f8aae"
    Payjp::Charge.create(
      amount: set_item[:price],
      card: buy_params[:token],
      currency:'jpy'
    )
  end

end
