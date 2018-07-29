Rails.application.routes.draw do
  devise_for :users
  root 'players#index'
  patch '/delete', to: 'players#delete', as: 'delete'
  resources :players
  resources :teams
end
