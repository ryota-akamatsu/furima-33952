class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         with_options presence: true do
         validates :birthday
         validates :nickname
         validates :last_name,presence: {message: 'last name cant be black'}
         validates :last_name_kana,presence: {message: 'last name kana cant be black'}
         validates :first_name,presence: {message: 'first name cant be black'}
         validates :first_name_kana,presence: {message: 'first name kana cant be black'}
         
         validates :first_name,
               format: {with:/\A[ぁ-んァ-ン一-龥]+\z/,message: 'first name cant be black'}
         validates :last_name,
               format: {with:/\A[ぁ-んァ-ン一-龥]+\z/,message: 'first name cant be black'}
         validates :first_name_kana,
               format: {with:/[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/,message: 'Full-width characters'}
        validates :last_name_kana,
               format: {with:/[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/,message: 'Full-width characters'}
        end
      end

