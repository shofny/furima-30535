class PurchasesController < ApplicationController

  before_action :authenticate_user!
  before_action :go_to_index

  def index
    @item = Item.find(params[:item_id])
    @user_purchase = UserPurchase.new
  end


  def create
    @user_purchase = UserPurchase.new(params_purchase)
    @item = Item.find(params[:item_id])
    if @user_purchase.valid?
        item_pay
    @user_purchase.save
    redirect_to root_path
      else
    @item = Item.find(params[:item_id])
    render action: :index
      end
  end

  private

  def params_purchase
    params.require(:user_purchase).permit(:postal_code, :prefecuture_id, :city, :address, :build_name, :tel).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def item_pay
    Payjp.api_key =  ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params_purchase[:token],
      currency: 'jpy'
      )
  end

  def go_to_index
    @item = Item.find(params[:item_id])
    if @item.purchase.present?
      redirect_to root_path 
    return
    end
    redirect_to root_path unless current_user.id != @item.user.id
  end

end
