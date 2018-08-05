Rails.application.routes.draw do
  devise_for :users do
	  get '/users/sign_out' => 'devise/sessions#destroy'
	end
  root 'players#home'
  # patch '/delete', to: 'teams#delete', as: 'delete'
  resources :players
  resources :teams
  get '/draft/:id/:round_number/:selected_player', to: 'teams#draft', as: 'draft'
  post '/draft/:id/:round_number/:selected_player', to: 'teams#add_player', as: 'add_player'
end
