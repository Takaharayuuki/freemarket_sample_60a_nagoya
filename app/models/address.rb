class Address < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :post_address 
    validates :city 
    validates :house_number
    validates :prefecture_id
  end


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end