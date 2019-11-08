# frozen_string_literal: true

<<<<<<< HEAD
class User < ApplicationRecord
=======
class User < ApplicationRecord # rubocop:todo Style/Documentation
>>>>>>> jordan2
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, email_format: { message: 'is not looking good' }
<<<<<<< HEAD

  validates :username, presence: true,
                       format: { with: /\A(?=.*[a-z])[a-z\d]+\Z/i },
                       uniqueness: { case_sensitive: false }

  has_many :comments
  has_many :posts
  has_many :likes, dependent: :destroy
=======
>>>>>>> jordan2
end
