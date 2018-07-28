Rails.application.routes.draw do
  root 'players#index'
  patch '/delete', to: 'players#delete', as: 'delete'
  resources :players
end
