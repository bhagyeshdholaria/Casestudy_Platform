Rails.application.routes.draw do
  devise_for :users

  root 'dashboard#index'

  get '/candidate_dashboard', to: 'dashboard#candidatedash', as: 'candidate_dashboard'
  get '/assessor_dashboard', to: 'dashboard#assessordash', as: 'assessor_dashboard'
  get '/contentcreator_dashboard', to: 'dashboard#contentcreatordash', as: 'contentcreator_dashboard'

  resources :casestudies do
    resources :pages, :questions
  end

  resources :traits, only: [:index, :new, :create, :destroy]
  resources :casestudy_users do
    resources :user_responses
    resources :assessor_responses
    post '/update-time', to: 'user_responses#updatetime', as: 'updatetime'
  end

  resources :manage_roles, only: [:index, :create]

  get '/casestudies/:casestudy_id/assessor/:assessor_id/start', to: 'walkin#entry', as: 'entry'
  post '/casestudies/:casestudy_id/assessor/:assessor_id/start', to: 'walkin#start', as: 'start'
end
