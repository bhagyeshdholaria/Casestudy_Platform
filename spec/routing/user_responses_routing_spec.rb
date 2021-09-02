require 'rails_helper'

RSpec.describe 'routes for user_responses', type: :routing do
  it 'GET /casestudy_users/:casestudy_user_id/user_responses -> user_responses#index' do
    expect(get(casestudy_user_user_responses_path(5))).to route_to('user_responses#index', casestudy_user_id: '5')
  end

  it 'POST /casestudy_users/:casestudy_user_id/user_responses -> user_responses#create' do
    expect(post(casestudy_user_user_responses_path(5))).to route_to('user_responses#create', casestudy_user_id: '5')
  end

  it 'GET /casestudy_users/:casestudy_user_id/user_responses/new -> user_responses#new' do
    expect(get(new_casestudy_user_user_response_path(5))).to route_to('user_responses#new', casestudy_user_id: '5')
  end

  it 'POST/casestudy_users/:casestudy_user_id/update-time -> user_responses#updatetime' do
    expect(post(casestudy_user_updatetime_path(4))).to route_to('user_responses#updatetime', casestudy_user_id: '4')
  end
end
