class Address < ApplicationRecord
  belongs_to :user, optional: true

  VALID_KANZI_REGEX = /\A[一-龥]+\z/
  
  validates :post_address, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ } , presence: true 
  validates :prefecture,format: { with: VALID_KANZI_REGEX } , presence: true 
  validates :city,format: { with: VALID_KANZI_REGEX } , presence: true 
  validates :house_number, presence: true 
end
