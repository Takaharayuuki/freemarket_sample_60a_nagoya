class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  # has_many_attached :images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :categories
  belongs_to :user
  # belongs_to :status
  # belongs_to :brand

  # mount_uploaders :images, ImageUploader
end