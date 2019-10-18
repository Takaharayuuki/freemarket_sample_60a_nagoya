class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_one :card
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address

  VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  VALID_KANZI_REGEX = /\A[一-龥]+\z/

  validates :nickname, presence: true ,length: {maximum: 20}, on: :validates_step1
  validates :email, presence: true, uniqueness: true , format: { with: VALID_EMAIL_REGEX }, on: :validates_step1
  validates :password, presence: true,length: { in: 7..128 }, on: :validates_step1
  validates :password_confirmation, presence: true, length: { in: 7..128 }, on: :validates_step1
  validates :first_name, presence: true,format: { with: VALID_KANZI_REGEX } ,on: :validates_step1
  validates :last_name, presence: true, format: { with: VALID_KANZI_REGEX } ,on: :validates_step1
  validates :first_name_kana, presence: true, format: { with: /\A([ァ-ン]|ー)+\z/ }, on: :validates_step1
  validates :last_name_kana, presence: true, format: { with: /\A([ァ-ン]|ー)+\z/ }, on: :validates_step1
  validates :birth_day, presence: true,numericality: { only_integer: true }, on: :validates_step1
  validates :birth_month, presence: true,numericality: { only_integer: true }, on: :validates_step1
  validates :birth_year, presence: true, numericality: { only_integer: true }, on: :validates_step1
  validates :tel, presence: true, format: { with: VALID_PHONE_REGEX } ,on: :validates_step2

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first
 
    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    auth.info.email,
        password: Devise.friendly_token[0, 20]
      )
    end
 
    user
  end

  # protected
  # def self.find_for_google(auth)
  #   user = User.find_by(email: auth.info.email)

  #   unless user
  #     user = User.create(name:     auth.info.name,
  #                        provider: auth.provider,
  #                        uid:      auth.uid,
  #                        token:    auth.credentials.token,
  #                        password: Devise.friendly_token[0, 20],
  #                        meta:     auth.to_yaml)
  #   end
  #   user
  # end




end
