class UserPurchase
  include ActiveModel::Model

  attr_accessor :postal_code, :prefecuture_id, :city, :address, :build_name, :tel, :item_id, :user_id

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecuture_id: prefecuture_id, city: city, address: address, build_name: build_name, tel: tel, purchase_id: purchase.id)
  end
end