require 'rails_helper'

RSpec.describe 'casestudy CRU', type: :system do
  before do
    driven_by(:rack_test)
  end

  context '/casestudies after sign in' do
    let(:user) { create(:user) }
    let(:casestudy) { create(:casestudy, creator: user) }

    it 'list all casestudies' do
      user.createdcasestudies << create_list(:casestudy, 5, creator: user)
      sign_in user
      visit '/'
      click_link 'Casestudies'

      expect(current_path).to eq '/casestudies'
      expect(page).to have_content user.email

      user.createdcasestudies.map(&:name).each do |cs_name|
        expect(page).to have_content cs_name
      end
    end

    it 'create new casestudy' do
      sign_in user
      visit '/casestudies'
      click_link 'Create Casestudy'
      expect(current_path).to eq '/casestudies/new'

      fill_in 'Name', with: casestudy.name
      fill_in 'Duration', with: casestudy.duration
      fill_in 'Scale', with: casestudy.scale

      click_on 'Create'
      # expect(response).to redirect_to casestudies_path(assigns(:casestudy))
      expect(page).to have_content casestudy.name
      expect(page).to have_content casestudy.duration
      expect(page).to have_content casestudy.scale

      click_link 'Add Page'
      # expect(current_path).to eq casestudy_new_page_path
      # puts current_path

      fill_in 'Body', with: 'page 1'
      click_on 'Save Page'
      puts current_path
      expect(page).to have_content /Add Page/

    end
  end
end
