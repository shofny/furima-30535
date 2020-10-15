class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  name_check = /\A[ぁ-んァ-ン一-龥]+\z/
  name_check_kana = /\A[ァ-ン]+\z/
  
  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  validates :first_name, presence: true, format: { with: name_check }
  validates :last_name, presence: true, format: { with: name_check }
  validates :first_name_kana, presence: true, format: { with: name_check_kana }
  validates :last_name_kana, presence: true, format: { with: name_check_kana }
  validates :birthday, presence: true

  has_many :items
end
