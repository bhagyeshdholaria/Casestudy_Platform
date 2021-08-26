require 'rails_helper'

RSpec.describe CasestudyUser, type: :model do
  subject { create(:casestudy_user) }
  describe 'validations' do
    it {
      should validate_inclusion_of(:status).in_array([ 'pending', 'ongoing', 'completed', 'assessed'])
                                           .with_message('enter valid status')
    }

    it 'validate presence of start/end time' do
      subject.status = 'ongoing'
      should validate_presence_of(:started_time)

      subject.status = 'assessed'
      should validate_presence_of(:completed_time).with_message('completed_time can not be empty.')

    end

    it 'validate assessor != user' do
      subject.assessor_id = subject.user_id
      subject.validate
      expect(subject.errors[:assessor_id]).to include /Assessor can't be the same as user/
    end
  end

  describe 'associations' do
    it { should belong_to(:casestudy) }
    it { should belong_to(:user) }
    it { should belong_to(:assessor).class_name('User') }
    it { should have_many(:user_responses) }
    it { should have_many(:assessor_responses) }
  end
end
