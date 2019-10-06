class User < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :statuses, dependent: :destroy
  has_many :evalutions, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :credit_cards, dependent: :destroy
  has_one :address, dependent: :destroy
end
