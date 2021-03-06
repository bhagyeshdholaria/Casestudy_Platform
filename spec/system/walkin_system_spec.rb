require 'rails_helper'

RSpec.describe 'user walks-in', type: :system do
  before do
    # driven_by :rack_test
  end

  let(:casestudy) { create(:casestudy) }
  let(:assessor) { create(:assessor) }

  it 'test start to end' do
    Role.create(name: 'candidate')

    visit entry_path(casestudy.id, assessor.id)
    fill_in 'Name', with: 'Bob'
    fill_in 'Email', with: 'bob@g.c'
    fill_in 'passkey', with: 'zxzx'
    click_on 'Submit'

    user_created = User.find_by(email: 'bob@g.c')
    casestudy_user_created = CasestudyUser.find_by(casestudy_id: casestudy.id,
                                                   assessor_id: assessor.id,
                                                   user_id: user_created.id)

    expect(current_path).to eq casestudy_user_user_responses_path(casestudy_user_created)

    click_on 'START'
    fill_in 'user_response[response]', with: 'answer 1', match: :first
    click_on 'Save', match: :first
    click_on 'Submit'
    expect(current_path).to eq candidate_dashboard_path
  end
end
