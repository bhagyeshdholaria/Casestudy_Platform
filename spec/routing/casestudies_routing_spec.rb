require 'rails_helper'

RSpec.describe 'routes for casestudies', type: :routing do
  it 'route /casestudies to casestudies#index' do
    expect(get('/casestudies')).to route_to 'casestudies#index'
  end
  # it 'route /casestudy/:id to casestudies#show'
  # it 'route /casestudies/new to casestudies#new'
  # it 'route /casestudies/:id to casestudies#update'
end
