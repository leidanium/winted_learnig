class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  

  has_many :articles

  has_one_attached :avatar

  has_many :c_sellers, class_name: 'Conversation', foreign_key: 'c_seller_id'
  has_many :c_buyers, class_name: 'Conversation', foreign_key: 'c_buyer_id'
end
