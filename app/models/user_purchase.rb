class UserPurchase
  include ActiveModel::Model

  attr_accessor :postal_code, :prefecuture_id, :city, :address, :build_name, :tel, :item_id, :user_id, :token, :price

  validates :user_id, :item_id, :postal_code, :prefecuture_id, :city, :address, :tel, presence: true
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :tel, length: { maximum: 11 }
  validates :prefecuture_id, numericality: { other_than: 1, message: "can't select '---'" }
  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecuture_id: prefecuture_id, city: city, address: address, build_name: build_name, tel: tel, purchase_id: purchase.id)
  end
end