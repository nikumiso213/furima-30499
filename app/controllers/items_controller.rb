class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.order(created_at: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params_item)
    if @item.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      redirect_to action: :index
    else
      render :show
    end
  end

  private

  def params_item
    params.require(:item).permit(:name, :description, :category_id, :status_id, :shopping_fee_id, :prefecture_id, :delivery_schedule_id, :price, :image).merge(user_id: current_user.id)
  end
end
