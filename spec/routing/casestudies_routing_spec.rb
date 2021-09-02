require 'rails_helper'

RSpec.describe 'routes for casestudies', type: :routing do
  it 'GET /casestudies -> casestudies#index' do
    expect(get('/casestudies')).to route_to 'casestudies#index'
  end

  it 'GET /casestudy/:id -> casestudies#show' do
    expect(get('/casestudies/4')).to route_to('casestudies#show', id: '4')
  end

  it 'GET /casestudies/new -> casestudies#new' do
    expect(get('/casestudies/new')).to route_to 'casestudies#new'
  end

  it 'PUT /casestudies/:id -> casestudies#update' do
    expect(patch('/casestudies/4')).to route_to('casestudies#update', id: '4')
  end
end
