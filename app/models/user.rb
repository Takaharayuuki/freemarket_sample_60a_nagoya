class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable,omniauth_providers: [:facebook, :google_oauth2]

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
  validates :birth_day, presence: true,numericality: { only_integer: true },length: {maximum: 2}, on: :validates_step1
  validates :birth_month, presence: true,numericality: { only_integer: true },length: {maximum: 2}, on: :validates_step1
  validates :birth_year, presence: true, numericality: { only_integer: true },length: {maximum: 4}, on: :validates_step1
  validates :tel, presence: true, format: { with: VALID_PHONE_REGEX } ,on: :validates_step2

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      user = User.where(id: snscredential.user_id).first
    else
      user = User.where(email: auth.info.email).first
      if user.present?
        SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      else
        user = User.create(
          nickname: auth.info.name,
          email:    auth.info.email,
          password: Devise.friendly_token[0, 20],
        
          )
        SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      end
    end
    return user
  end



end
