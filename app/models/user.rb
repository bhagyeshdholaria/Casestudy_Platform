class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :validatable

  has_many :role_users
  has_many :roles, through: :role_users

  has_many :casestudy_users
  has_many :casestudies, through: :casestudy_users

  has_many :assessor_responses

  has_many :createdcasestudies, class_name: 'Casestudy', foreign_key: 'creator_id'


  validates :name, length: { minimum: 3 }
  validates :email, uniqueness: true, presence: true,
                    format: { with: /\A[\w.+-]+@\w+\.\w+\z/, message: 'Enter valid email address' }
end
