require 'rails_helper'

RSpec.describe Casestudy, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(3) }
    it { should validate_presence_of(:duration) }
    it { should validate_numericality_of(:duration).only_integer }
    it { should validate_presence_of(:scale) }
    it { should validate_numericality_of(:scale).only_integer.is_greater_than_or_equal_to(1) }
  end

  describe 'associations' do
    it { should have_many(:pages) }
    it { should have_many(:questions) }
    it { should belong_to(:creator).class_name('User') }
    it { should have_many(:casestudy_users) }
    it { should have_many(:users).through(:casestudy_users) }
    it { should have_many(:traits).through(:questions) }

  end
end
