class Address < ApplicationRecord
  belongs_to :user

  validates :post_address, presence: true 
  validates :prefecture, presence: true 
  validates :city, presence: true 
  validates :house_number, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end