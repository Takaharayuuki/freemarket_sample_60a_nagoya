class Item < ApplicationRecord
  has_many :images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :categories
  belongs_to :user
  belongs_to :status
  belongs_to :brand
end
