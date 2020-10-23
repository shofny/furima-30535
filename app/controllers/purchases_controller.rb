class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @user_purchase = UserPurchase.new
  end


  def create
    @user_purchase = UserPurchase.new(params_purchase)
    binding.pry
    @user_purchase.save
    redirect_to root_path
  end

  private

  def params_purchase
    binding.pry
    params.require(:user_purchase).permit(:postal_code, :prefecuture_id, :city, :address, :build_name, :tel).merge(user_id: current_user.id, item_id: params[:item_id])
  end


end
