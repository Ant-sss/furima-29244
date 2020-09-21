class ItemsController < ApplicationController
  before_action :move_to_index_login, except: [:index, :show, :search]
  before_action :set_item, only: [:show, :edit, :update ,:destroy]
  before_action :move_to_index_user, only: [:edit]
  before_action :search_item

  def index
    @items = Item.all.order("created_at DESC")
    @buy = Buy.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def search
    @buy = Buy.all
    @results = @p.result
    # binding.pry
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :status_id, :deliveryfee_id, :shipfrom_id, :day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index_login
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index_user
    @item = Item.find(params[:id])
    unless current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def search_item
    @p = Item.ransack(params[:q])
    @category_id = Category.where.not(id: 1)
    @status_id = Status.where.not(id: 1)
    @deliveryfee_id = Deliveryfee.where.not(id: 1)
  end

end
