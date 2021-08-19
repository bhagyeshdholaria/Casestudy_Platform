class Question < ApplicationRecord
  belongs_to :casestudy

  has_many :user_responses

  has_many :question_traits
  has_many :traits, through: :question_traits

  validates :body, presence: true
end
