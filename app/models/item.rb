class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :delivery_source
  belongs_to_active_hash :delivery_days

  belongs_to :user
  has_one_attached :image

  validates :name, :description, :image, :category, :status, :shipping_fee, :delivery_source, :delivery_days, :price, presence: true

  validates :category_id, :status_id, :shipping_fee_id, :delivery_source_id, :delivery_days_id, numericality: { other_than: 1, message: "can't select '---'" }

  validates :price, numericality: { only_integer: true }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'within the range form 300 ~ 9,999,999' }
end
