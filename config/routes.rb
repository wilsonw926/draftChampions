Rails.application.routes.draw do
  devise_for :users
  root 'players#index'
  # patch '/delete', to: 'teams#delete', as: 'delete'
  resources :players
  resources :teams
  get '/draft/:round_number', to: 'teams#draft', as: 'draft'
end
