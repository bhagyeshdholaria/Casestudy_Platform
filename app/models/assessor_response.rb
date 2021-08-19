class AssessorResponse < ApplicationRecord
  belongs_to :casestudy_user
  belongs_to :question_trait
  belongs_to :user
  belongs_to :assessor, class_name: 'User'

  validate :check_assessor_id
  validates :rating, numericality: true

  def check_assessor_id
    errors.add(:assessor_id, "Assessor can't be the same as user") if user_id == assessor_id
  end
end
