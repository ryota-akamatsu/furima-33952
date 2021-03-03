class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :items
         
         with_options presence: true do
         validates :birthday
         validates :nickname
         validates :last_name
         validates :last_name_kana
         validates :first_name
         validates :first_name_kana
         
         validates :first_name,
               format: {with:/\A[ぁ-んァ-ン一-龥]+\z/}
         validates :last_name,
               format: {with:/\A[ぁ-んァ-ン一-龥]+\z/ }
         validates :first_name_kana,
               format: {with:/[\p{katakana}ー－&&[^ -~｡-ﾟ]]+/}
        validates :last_name_kana,
               format: {with:/[\p{katakana}ー－&&[^ -~｡-ﾟ]]+/}
        validates :password,
               format:{with:/\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,12}\z/}
        end
      end

