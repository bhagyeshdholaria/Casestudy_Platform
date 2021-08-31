require 'rails_helper'

RSpec.describe 'assigning roles', type: :system do
  before do
    driven_by :rack_test
  end

  let(:user) { create(:user) }
  let(:candidate_user) { create(:candidate) }
  let(:assessor_role) { create(:role, name: 'assessor') }

  it 'assign additional role' do
    sign_in user
    candidate_user; assessor_role
    visit '/'
    within 'nav' do
      click_link 'Manage Roles'
    end
    within '#role_user_user_id' do
      find(:option, candidate_user.name).click
    end

    within '#role_user_role_id' do
      find(:option, 'assessor').click
    end
    uncheck 'force'
    click_on 'Assign'
    expect(current_path).to eq manage_roles_path
  end

  it 'overwrite assigned roles' do
    sign_in user
    candidate_user; assessor_role
    visit '/'
    within 'nav' do
      click_link 'Manage Roles'
    end

    within '#role_user_user_id' do
      find(:option, candidate_user.name).click
    end
    within '#role_user_role_id' do
      find(:option, 'assessor').click
    end
    check 'force'
    click_on 'Assign'
    expect(current_path).to eq manage_roles_path
  end
end
