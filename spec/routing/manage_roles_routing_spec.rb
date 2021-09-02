require 'rails_helper'

RSpec.describe 'routes for manage_roles', type: :routing do
  it 'GET /manage_roles -> manage_roles#index' do
    expect(get(manage_roles_path)).to route_to('manage_roles#index')
  end

  it 'POST /manage_roles -> manage_roles#create' do
    expect(post(manage_roles_path)).to route_to('manage_roles#create')
  end
end
