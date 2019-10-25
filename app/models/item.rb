class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :user

  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :category_id, presence: true
  validates :condition, presence: true
  validates :burden, presence: true
  validates :shipping_method, presence: true
  validates :indication, presence: true
  validates :price, presence: true,numericality: { only_integer: true, greater_than: 299, less_than: 10000000}
  # validates :size, presence: true
  # validates :delivery_fee, presence: true

  # has_many :comments, dependent: :destroy
  # has_many :likes, dependent: :destroy
  # belongs_to :category
  # belongs_to :status
  # belongs_to :brand
end