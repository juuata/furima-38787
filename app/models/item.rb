class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :days_for_shipping

  validates :items_name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shipping_charge_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :days_for_shipping_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :price, presence: true
   
end
