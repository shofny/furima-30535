class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_find, only: [:show, :edit, :update, :destroy]
  before_action :go_to_index, only: [:edit]

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
  end

  def edit
  end

  def update
    if @item.update(params_item)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    else
      @items = Item.all.order('created_at DESC')
      render :index
    end
  end

  private

  def params_item
    params.require(:item).permit(:name, :description, :image, :category_id, :status_id, :shipping_fee_id, :delivery_source_id, :delivery_days_id, :price).merge(user_id: current_user.id)
  end

  def go_to_index
    redirect_to action: :index unless current_user.id == @item.user.id
  end

  def item_find
    @item = Item.find(params[:id])
  end
end
