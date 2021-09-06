require 'rails_helper'

RSpec.describe 'assess', type: :system do
  before do
    # driven_by :rack_test
  end
  let(:casestudy_user) { create(:completed_csu) }
  let(:user_responses) do
    casestudy_user.casestudy.questions.each do |q|
      create(:user_response, casestudy_user: casestudy_user, user: casestudy_user.user, question: q)
    end
  end

  # let(:assessor) { create(:assessor) }
  it 'assessor logged_in' do
    puts casestudy_user.inspect
    puts '##############'
    puts casestudy_user.casestudy.questions.inspect
    puts '##############'
    puts user_responses.inspect
    puts '##############'
    puts UserResponse.all.inspect
    puts '##############'

    sign_in casestudy_user.assessor
    visit casestudy_users_path
    puts current_path
    click_link 'Assess'
    expect(current_path).to eq new_casestudy_user_assessor_response_path(casestudy_user)
  end
end
