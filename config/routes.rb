Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :bets
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :chips, only: [:index, :show]

  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end

  resources :users do
    resource :wallet
  end

  post '/users/:user_id/wallet/update_balance', to: 'wallets#update_balance', as: 'update_balance'

  post "bets/:bet_id/user_bet_create", to: "user_bets#create", as: "user_bet"
  delete 'bets/:id', to: 'bets#destroy', as: 'delete_bet'
end
