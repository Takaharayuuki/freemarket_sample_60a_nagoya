class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  belongs_to :user, optional:true
  belongs_to :category

  with_options presence: true do
    validates :category_id
    validates :condition
    validates :burden
    validates :shipping_method
    validates :indication
    validates :price
  end
  
  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10000000}

end