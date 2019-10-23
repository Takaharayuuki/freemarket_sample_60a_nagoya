class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  has_many   :images,dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :category
  belongs_to :user
  # belongs_to :status
  # belongs_to :brand
end