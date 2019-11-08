# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, email_format: { message: 'is not looking good' }

  validates :username, presence: true,
                       format: { with: /\A(?=.*[a-z])[a-z\d]+\Z/i },
                       uniqueness: { case_sensitive: false }

  has_many :comments
  has_many :likes, dependent: :destroy
  # has_many :photos
end
