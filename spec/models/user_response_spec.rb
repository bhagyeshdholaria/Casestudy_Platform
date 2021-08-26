require 'rails_helper'

RSpec.describe UserResponse, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:response) }
  end

  describe 'associations' do
    it { should belong_to(:question) }
    it { should belong_to(:user) }
    it { should belong_to(:casestudy_user) }
  end
end
