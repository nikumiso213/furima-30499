class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :edit]
  before_action :set_item, only: [:show, :destroy, :edit, :update]
  before_action :move_to_index, only: [:edit]

  def index
    @items = Item.all.order(created_at: 'DESC')
  end

  def show
    @comment = Comment.new
    @comments = Comments.where(item_id: params[:id]).includes(:user)
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

  def update
    if @item.update(params_item)
      redirect_to actin: :index
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to action: :index
    else
      render :show
    end
  end

  private

  def params_item
    params.require(:item).permit(:name, :description, :category_id, :status_id, :shopping_fee_id, :prefecture_id, :delivery_schedule_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in? && current_user.id == @item.user.id
    redirect_to action: :index if Purchase.find_by(item_id: @item.id)
  end
end
