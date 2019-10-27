class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  belongs_to :user, optional:true
  belongs_to :category
  belongs_to :buyer, foreign_key: "buyer_id", class_name: "User", optional: true
  belongs_to :saler, foreign_key: "saler_id", class_name: "User"

  validates :name ,presence: true, length: { maximum: 40 }
  validates :description ,presence: true, length: { maximum: 1000 }
  validates :condition ,presence: true
  validates :burden ,presence: true
  validates :shipping_method ,presence: true
  validates :indication ,presence: true
  validates :price ,presence: true
  validates :delivery_area ,presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 299, less_than: 10000000 }
  validates :category_id,  numericality: { only_integer: true, greater_than: 1 }
end