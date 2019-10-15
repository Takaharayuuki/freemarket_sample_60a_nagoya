class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
         
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
  # validates :nickname, presence: true ,length: {maximum: 20}
  # validates :email, presence: true, uniqueness: true , format: { with: VALID_EMAIL_REGEX } ,length: { in: 7..128 }  
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :first_name_kana, presence: true
  # validates :last_name_kana, presence: true
  # validates :birth_day, presence: true
  # validates :birth_month, presence: true
  # validates :birth_year, presence: true


end
