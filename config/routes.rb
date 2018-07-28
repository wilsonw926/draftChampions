Rails.application.routes.draw do
  root 'player#index'
  resources :players
end
