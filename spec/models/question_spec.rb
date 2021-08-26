require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:body) }
  end

  describe 'associations' do
    it { should belong_to(:casestudy) }
    it { should have_many(:user_responses) }
    it { should have_many(:question_traits) }
    it { should have_many(:traits).through(:question_traits) }
  end
end
