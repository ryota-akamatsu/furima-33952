class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :encrypted_password,:password,:password_confirmation,length:{minimum:7},format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/}
         validates :nickname, presence: true
         validates :last_name,presence: {message: 'last name cant be black'}
         validates :last_name_kana,presence: {message: 'last name kana cant be black'}
         validates :first_name,presence: {message: 'first name cant be black'}
         validates :first_name_kana,presence: {message: 'first name kana cant be black'}
         validates :birthday,presence: true
         validates :first_name,
               :last_name,
               :first_name_kana,
               :last_name_kana,
               format: {with: /[^ -~｡-ﾟ]+/,message: 'Full-width characters'}
        end
