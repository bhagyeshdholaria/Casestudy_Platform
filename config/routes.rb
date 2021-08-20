Rails.application.routes.draw do
  devise_for :users

  root 'dashboard#index'
  
  get '/candidate_dashboard', to: 'dashboard#candidatedash', as: 'candidate_dashboard'
  get '/assessor_dashboard', to: 'dashboard#assessordash', as: 'assessor_dashboard'
  get '/contentcreator_dashboard', to: 'dashboard#contentcreatordash', as: 'contentcreator_dashboard'

  resources :casestudies do
    get '/new_page', to: 'casestudies#newpage'
    post '/new_page', to: 'casestudies#createpage'
  end
end
