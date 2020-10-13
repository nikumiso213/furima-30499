class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index]
  before_action :move_to_index, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new()
  end

  def create
    @purchase_address = PurchaseAddress.new(params_purchase)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render action: :index
    end
  end

  private

  def params_purchase
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user.id == @item.user.id
      redirect_to root_path
    elsif Purchase.find_by(item_id: params[:item_id])
      redirect_to root_path
    end
  end
end
