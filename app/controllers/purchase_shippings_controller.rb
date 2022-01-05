class PurchaseShippingsController < ApplicationController
  before_action :item_id_params, only: [:index, :create]
  before_action :authenticate_seller, only: [:index, :create]
  def index
    @purchase_shipping = PurchaseShipping.new
  end

  def create
    @purchase_shipping = PurchaseShipping.new(purchase_shipping_params)
    if @purchase_shipping.valid?
      pay_item
      @purchase_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_shipping_params
    params.require(:purchase_shipping).permit(:postcode, :prefecture_id, :city, :street_address, :building, :tel).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def item_id_params
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_shipping_params[:token],
      currency: 'jpy'
    )
  end

  def authenticate_seller
    if user_signed_in?
      if @item.purchase_item || current_user == @item.user
        redirect_to root_path
      end
    else
      redirect_to new_user_session_path
    end
  end
end
