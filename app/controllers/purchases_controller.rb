class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @user_purchase = UserPurchase.new
  end


  def create
    binding.pry
    @user_purchase = UserPurchase.new(params_purchase)
      if @user_purchase.valid?
    @user_purchase.save
    redirect_to root_path
      else
    @item = Item.find(params[:item_id])
    render action: :index
      end
  end

  private

  def params_purchase
    params.require(:user_purchase).permit(:postal_code, :prefecuture_id, :city, :address, :build_name, :tel).merge(user_id: current_user.id, item_id: params[:item_id])
  end


end
