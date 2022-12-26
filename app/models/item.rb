class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :items_name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :shipping_charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :days_for_shipping_id, presence: true
  validates :price, presence: true
   
end
