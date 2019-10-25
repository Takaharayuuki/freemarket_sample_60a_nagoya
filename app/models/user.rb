class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  has_one :card
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
  has_many :items


  VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/

  validates :nickname, presence: true ,length: {maximum: 20}, on: :validates_step1
  validates :email, presence: true, uniqueness: true , format: { with: VALID_EMAIL_REGEX }, on: :validates_step1
  validates :password, presence: true,length: { in: 7..128 }, on: :validates_step1
  validates :password_confirmation, presence: true, length: { in: 7..128 }, on: :validates_step1
  validates :first_name, presence: true, on: :validates_step1
  validates :last_name, presence: true, on: :validates_step1
  validates :first_name_kana, presence: true,format: {
    with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,
    message: "全角カタカナのみで入力して下さい"
  }, on: :validates_step1
  validates :last_name_kana, presence: true,format: {
    with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,
    message: "全角カタカナのみで入力して下さい"
  }, on: :validates_step1
  validates :birth_day, presence: true,length: {maximum: 2}, on: :validates_step1
  validates :birth_month, presence: true,length: {maximum: 2}, on: :validates_step1
  validates :birth_year, presence: true,length: {maximum: 4}, on: :validates_step1
  validates :tel, presence: true, format: { with: VALID_PHONE_REGEX } ,on: :validates_step2
end
