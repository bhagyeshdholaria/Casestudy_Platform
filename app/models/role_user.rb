class RoleUser < ApplicationRecord
  belongs_to :role
  belongs_to :user

  validates_presence_of :role_id, :user_id
  validates :user, uniqueness: { scope: :role }
end
