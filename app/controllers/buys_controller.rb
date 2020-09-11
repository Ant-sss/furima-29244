class BuysController < ApplicationController
  before_action :set_item, only: [:index, :create]
  
  def index
    # binding.pry
    @address = BuyAddress.new
  end

  def create 
    @address = BuyAddress.new(address_params)
    # binding.pry
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

end
