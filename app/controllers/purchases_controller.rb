class PurchasesController < ApplicationController



  def index
    @item = Item.find(params[:item_id])
    @user_purchase = UserPurchase.new
  end


  def create
    @user_purchase = UserPurchase.new(params_purchase)
    @item = Item.find(params[:item_id])
    binding.pry
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
    Payjp.api_key =  "sk_test_9b62b00b24547c1f9dbc6ab3"
    Payjp::Charge.create(
      amount: @item.price,
      card: params_purchase[:token],
      currency: 'jpy'
      )
  end

end
