class BuysController < ApplicationController
  
  def index
    @buy = Buy.new
    @item = Item.find(params[:item_id])
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def address_params
    params.permit(:postal_code, :prefecture_id, :city, :building_name, :phone_num)
  end

end
