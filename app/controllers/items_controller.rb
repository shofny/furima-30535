class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(params_item)
    redirect_to root_path
  end


  private

  def params_item
    params.require(:item).permit(:name, :description, :image, :category_id, :status_id, :shipping_fee_id, :delivery_source_id, :delivery_days_id, :price).merge(user_id: current_user.id)
  end
end
