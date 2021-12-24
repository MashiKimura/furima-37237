class ItemsController < ApplicationController
  before_action :item_id_params, only: [:show, :edit, :update]
  before_action :authenticate_seller, only: [:edit, :update]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    redirect_to new_user_session_path unless user_signed_in?
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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :situation_id, :delivery_id, :prefecture_id,
                                 :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def authenticate_seller
    if user_signed_in?
      unless current_user == @item.user
        redirect_to root_path
      end
    else
      redirect_to new_user_session_path
    end
  end

  def item_id_params
    @item = Item.find(params[:id])
  end
end
