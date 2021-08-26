require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(3) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it {
      should allow_values('a@c.c', 'dsa.f3@jo.sdf', '239@gmail.co')
        .for(:email)
    }
    it {
      should_not allow_values('.c', 'g.b', '@g.v', '@gv', 'asd@fb')
        .for(:email)
    }
  end

  describe 'associations' do
    it { should have_many(:role_users) }
    it { should have_many(:roles).through(:role_users) }

    it { should have_many(:casestudy_users) }
    it { should have_many(:casestudies).through(:casestudy_users) }

    it { should have_many(:assessor_responses) }

    it { should have_many(:createdcasestudies).class_name('Casestudy').with_foreign_key('creator_id') }
  end
end
