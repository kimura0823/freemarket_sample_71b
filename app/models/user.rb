class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_save { self.email = email.downcase }
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :birthdayy
  belongs_to_active_hash :birthdaym
  belongs_to_active_hash :birthdayd

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :birthdayy_id, presence: true
  validates :birthdaym_id, presence: true
  validates :birthdayd_id, presence: true
  validates :nickname, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true, uniqueness: true

  has_many :products
  has_one :address
  has_one :card

  
 
end
