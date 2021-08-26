require 'rails_helper'

RSpec.describe Trait, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  describe 'associations' do
    it { should have_many(:question_traits) }
    it { should have_many(:questions).through(:question_traits) }
  end
end
