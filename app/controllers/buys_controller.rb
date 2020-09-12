class BuysController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :move_to_signed_in
  before_action :move_to_index
  
  def index

    @address = BuyAddress.new
  end

  def create 
    @address = BuyAddress.new(address_params)
 
    if @address.valid?
      @address.save
      pay_item
      redirect_to root_path
    else
      render "index"
    end
  end

  private

  def address_params
    params.permit(:postal_code, :prefecture_id, :city, :house_num, :building_name, :phone_num, :token).merge(user_id: current_user.id,item_id: @item.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def buy_params
    params.permit(:token)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: set_item[:price],
      card: buy_params[:token],
      currency:'jpy'
    )
  end

  def move_to_signed_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

end
