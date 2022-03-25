class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

         validates :nickname,               presence: true
         validates :family_name,
         format: { with: /\A[ぁ-んァ-ン一-龥]/},
         presence: true
         validates :first_name,
         format: { with: /\A[ぁ-んァ-ン一-龥]/},
         presence: true
         validates :family_name_kana,
         format: { with: /\A[ァ-ヶー-]+\z/},
         presence: true
         validates :first_name_kana,
         format: { with: /\A[ァ-ヶー-]+\z/},
         presence: true
         validates :birth_day,              presence: true

         has_many :items
        #  has_many :buyers
end
