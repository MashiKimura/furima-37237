class PurchaseShippingsController < ApplicationController

  def index
    @purchase_shipping = PurchaseShipping.new
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase_shipping = PurchaseShipping.new(purchase_shipping_params)
    @item = Item.find(params[:item_id])
    if @purchase_shipping.valid?
      @purchase_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_shipping_params
    params.require(:purchase_shipping).permit(:postcode, :prefecture_id, :city, :street_address, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
