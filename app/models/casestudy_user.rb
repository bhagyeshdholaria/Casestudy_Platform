class CasestudyUser < ApplicationRecord
  belongs_to :casestudy
  belongs_to :user
  belongs_to :assessor, class_name: 'User'

  has_many :user_responses

  has_many :assessor_responses

  validates :status, acceptance: { accept: [ 'pending', 'ongoing', 'completed', 'assessed' ], message: 'enter valid status' }
  validates_presence_of :started_time, if: -> { status == 'ongoing' || status == 'completed' }
  validates_presence_of :completed_time, if: -> { status == 'completed' || status == 'assessed' }, message: 'completed_time can not be empty.'

  # validates :assessor_id, numericality: { other_than: :user_id }
  validate :check_assessor_id

  def check_assessor_id
    errors.add :assessor_id, message: "Assessor can't be the same as user" if user_id == assessor_id
  end
end
