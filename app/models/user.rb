class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/
  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  KANA_REGEX = /\A[ァ-ヶー－]+\z/
  
  validates :nickname,:birthday, presence: true
  validates :password, presence: true, format: { with: PASSWORD_REGEX }
  validates :first_name, :last_name, presence: true, format: { with: NAME_REGEX }
  validates :first_name_kana, :last_name_kana, presence: true, format: { with: KANA_REGEX }
  has_many :items, dependent: :destroy
  has_many :buys, dependent: :destroy
end
