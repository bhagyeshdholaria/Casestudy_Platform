require 'rails_helper'

RSpec.describe 'casestudy CRU', type: :system do
  before do
    # driven_by(:rack_test)
  end

  context '/casestudies after sign in' do
    let(:user) { create(:user) }
    let(:casestudy) { create(:casestudy, creator: user) }
    let(:trait) { create(:trait) }


    it 'list all casestudies' do
      driven_by(:rack_test)
      user.createdcasestudies << create_list(:casestudy, 5, creator: user)
      sign_in user
      visit '/'
      click_link 'Casestudies'
      expect(current_path).to eq '/casestudies'
      expect(page).to have_content user.email
      # page.save_screenshot('list of casestudies.png')
      user.createdcasestudies.map(&:name).each do |cs_name|
        expect(page).to have_content cs_name
      end
    end


    it 'create new casestudy with page and question' do
      driven_by(:rack_test)
      sign_in user
      visit '/casestudies'
      click_link 'Create Casestudy'
      expect(current_path).to eq '/casestudies/new'

      fill_in 'Name', with: casestudy.name
      fill_in 'Duration', with: casestudy.duration
      fill_in 'Scale', with: casestudy.scale
      click_on 'Save'
      expect(page).to have_content casestudy.name
      expect(page).to have_content casestudy.duration
      expect(page).to have_content casestudy.scale

      # ------------------------------------------------------------- ADD NEW PAGE
      click_link 'Add Page'

      expect(page).to have_content /Enter Page Content/
      fill_in 'Body', with: 'page 1'
      click_on 'Save Page'
      expect(page).to have_content /Add Page/
      expect(page).to have_content /Situation/

      # ------------------------------------------------------------- ADD NEW QUESTION
      click_link 'Add Question'
      expect(page).to have_content /Enter Question/
      fill_in 'Body', with: 'Question 1'
      click_on 'Save Question'
      expect(page).to have_content /Add Question/
      expect(page).to have_content /Questions/
    end


    it 'edit and delete existing casestudy page' do
      sign_in user
      visit casestudy_path(casestudy)
      casestudy.pages.map(&:body).each do |cs_name|
        expect(page).to have_content cs_name
      end
      within '#situation' do
        click_link 'Edit', match: :first
      end
      fill_in 'Body', with: 'edited page content'
      click_on 'Save Page'
      expect(current_path).to eq casestudy_path casestudy

      page.accept_confirm do
        within '#situation' do
          click_link 'Delete', match: :first
        end
      end
      expect(page).not_to have_content casestudy.pages.first.body
    end


    it 'edit and delete existing casestudy question' do
      sign_in user
      Trait.create([{ name: 'trait 1' }, { name: 'trait 2' }, { name: 'trait 3' }])
      casestudy.questions.first.traits << Trait.last
      visit casestudy_path(casestudy)
      click_on 'Questions'

      casestudy.questions.map(&:body).each do |q_body|
        expect(page).to have_content q_body
      end
      within '#questions' do
        click_link 'Edit', match: :first
      end
      fill_in 'Body', with: 'edited question'
      find(:option, 'trait 1').click(:ctrl)
      click_on 'Save Question'
      click_on 'Questions'

      page.accept_confirm do
        within '#questions' do
          click_link 'Delete', match: :first
        end
      end
      expect(page).not_to have_content casestudy.questions.first.body
    end


    it 'add/remove traits' do
      driven_by :rack_test
      sign_in user
      visit traits_path
      click_on 'Add Trait'
      fill_in 'Trait:', with: 'trait fgh'
      click_button 'Add Trait'
      expect(page).to have_content 'trait fgh'
    end

  end
end
