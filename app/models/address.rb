class Address < ApplicationRecord
  belongs_to :user, optional: true

  validates :post_address, presence: true 
  validates :prefecture, presence: true 
  validates :city, presence: true 
  validates :house_number, presence: true
end
