class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  belongs_to :user, optional:true
  belongs_to :category

  validates :name ,presence: true, length: { maximum: 40 }
  validates :description ,presence: true, length: { maximum: 1000 }
  validates :condition ,presence: true
  validates :burden ,presence: true
  validates :shipping_method ,presence: true
  validates :indication ,presence: true
  validates :price ,presence: true
  validates :brand ,presence: true
  validates :delivery_area ,presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 299, less_than: 10000000 }
end