require 'rails_helper'

RSpec.describe 'assigning roles', type: :system do
  before do
    driven_by :rack_test
  end

  let(:user) { create(:user) }
  let(:newrole) { create(:role, name: 'assessor') }
  let(:candidate_user) { create(:candidate) }

  it 'assign additional role' do
    sign_in user
    newrole
    candidate_user
    visit '/'
    within 'nav' do
      click_link 'Manage Roles'
    end
    within '#role_user_user_id' do
      find(:option, candidate_user.name).click
    end
    within '#role_user_role_id' do
      find(:option, newrole.name).click
    end
    click_on 'Assign'
    expect(current_path).to eq manage_roles_path
  end

  it 'overwrite assigned roles' do
    sign_in user
    newrole
    candidate_user
    visit '/'
    within 'nav' do
      click_link 'Manage Roles'
    end
    within '#role_user_user_id' do
      find(:option, candidate_user.name).click
    end
    within '#role_user_role_id' do
      find(:option, newrole.name).click
    end
    check 'force'
    click_on 'Assign'
    expect(current_path).to eq manage_roles_path
  end
end
