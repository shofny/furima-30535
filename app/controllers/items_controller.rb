class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params_item)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(params_item)
    if @item.save
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def params_item
    params.require(:item).permit(:name, :description, :image, :category_id, :status_id, :shipping_fee_id, :delivery_source_id, :delivery_days_id, :price).merge(user_id: current_user.id)
  end
end
