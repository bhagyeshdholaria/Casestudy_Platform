Rails.application.routes.draw do
  devise_for :users

  root 'dashboard#index'

  get '/candidate_dashboard', to: 'dashboard#candidatedash', as: 'candidate_dashboard'
  get '/assessor_dashboard', to: 'dashboard#assessordash', as: 'assessor_dashboard'
  get '/contentcreator_dashboard', to: 'dashboard#contentcreatordash', as: 'contentcreator_dashboard'

  resources :casestudies do
    resources :pages
    resources :questions
  end

  resources :traits, only: [:index, :new, :create, :destroy]
end
