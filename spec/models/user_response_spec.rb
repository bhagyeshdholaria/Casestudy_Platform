require 'rails_helper'

RSpec.describe UserResponse, type: :model do

  describe 'associations' do
    it { should belong_to(:question) }
    it { should belong_to(:user) }
    it { should belong_to(:casestudy_user) }
  end
end
