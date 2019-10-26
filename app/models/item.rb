class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  belongs_to :user, optional:true
  belongs_to :category
  belongs_to :buyer, foreign_key: "buyer_id", class_name: "User", optional: true
  belongs_to :saler, foreign_key: "saler_id", class_name: "User"

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :condition
    validates :burden
    validates :shipping_method
    validates :indication
    validates :price
  end
  
  validates :name, length: { maximum: 40 }
  validates :description, length: { maximum: 1000 }
  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10000000}

end