class QuestionTrait < ApplicationRecord
  belongs_to :question
  belongs_to :trait

  has_many :assessor_responses

end
