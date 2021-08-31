class UserResponse < ApplicationRecord
  belongs_to :question
  belongs_to :user
  belongs_to :casestudy_user

  # validates :response, presence: true
end
