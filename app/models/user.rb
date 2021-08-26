class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :validatable
  after_create :add_role

  has_many :role_users
  has_many :roles, through: :role_users

  has_many :casestudy_users
  has_many :casestudies, through: :casestudy_users

  has_many :assessor_responses

  has_many :createdcasestudies, class_name: 'Casestudy', foreign_key: 'creator_id'


  validates :name, length: { minimum: 3 }, presence: true
  validates :email, uniqueness: true, presence: true,
                    format: { with: /\A[\w.+-]+@\w+\.\w+\z/, message: 'Enter valid email address' }

  scope :having_role, ->(role_name) { joins(:roles).where(roles: { name: role_name }) }
  scope :not_cc, -> { joins(:roles).where.not(roles: { name: 'contentcreator' }) }

  private

  def add_role
    RoleUser.create(user_id: id, role_id: 1)
  end
end
