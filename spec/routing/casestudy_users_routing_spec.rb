require 'rails_helper'

RSpec.describe 'routes for casestudy_users', type: :routing do
  it 'GET /casestudy_users -> casestudy_users#index' do
    expect(get(casestudy_users_path)).to route_to('casestudy_users#index')
  end

  it 'POST /casestudy_users -> casestudy_users#create' do
    expect(post(casestudy_users_path)).to route_to('casestudy_users#create')
  end

  it 'GET /casestudy_users/new -> casestudy_users#new' do
    expect(get(new_casestudy_user_path)).to route_to('casestudy_users#new')
  end
end
