require 'rails_helper'

RSpec.describe AssessorResponse, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:rating) }
    it { should validate_numericality_of(:rating) }
  end

  describe 'associations' do
    it { should belong_to(:casestudy_user) }
    it { should belong_to(:question_trait) }
    it { should belong_to(:user) }
    it { should belong_to(:assessor).class_name('User') }
  end
end
