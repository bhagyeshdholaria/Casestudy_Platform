require 'rails_helper'

RSpec.describe 'Take assessment', type: :system do
  before do
    driven_by :rack_test
  end

  let(:user) { create(:user) }
  let(:casestudy) { create(:casestudy, creator: user) }
  let(:assessor) { create(:assessor) }
  let(:candidate) { create(:candidate) }

  it 'take new assessment' do
    sign_in user
    casestudy; assessor; candidate
    visit '/'
    expect(current_path).to have_content /contentcreator_dashboard/

    click_on 'Set Assessment'
    expect(current_path).to eq new_casestudy_user_path
    within '#casestudy_user_casestudy_id' do
      find(:option, user.createdcasestudies.first.name).click
    end
    within '#casestudy_user_assessor_id' do
      find(:option, assessor.name).click
    end
    within '#casestudy_user_user_id' do
      find(:option, candidate.name).click
    end
    click_on 'Assign Casestudy'

    CasestudyUser.all.map(&:id).each do |id|
      expect(page).to have_content id
    end
  end
end
