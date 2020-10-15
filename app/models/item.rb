class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :delivery_source
  belongs_to_active_hash :delivery_days

  belongs_to :user
  has_one_attached :image

end
