class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :go_to_index
  before_action :find_item, only: [:index, :create]

  def index
    @user_purchase = UserPurchase.new
  end

  def create
    @user_purchase = UserPurchase.new(params_purchase)
    if @user_purchase.valid?
      item_pay
      @user_purchase.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def params_purchase
    params.require(:user_purchase).permit(:postal_code, :prefecuture_id, :city, :address, :build_name, :tel).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def item_pay
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: params_purchase[:token],
      currency: 'jpy'
    )
  end

  def go_to_index
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user.id || @item.purchase.present?
  end

  def find_item
    @item = Item.find(params[:item_id])
  end
end
