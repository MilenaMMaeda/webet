Rails.application.routes.draw do
  get 'wallet/show'
  devise_for :users
  root to: "pages#home"
  resources :bets
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users do
    resource :wallet
  end

  post "bets/:bet_id/user_bet_create", to: "user_bets#create", as: "user_bet"
  delete 'bets/:id', to: 'bets#destroy', as: 'delete_bet'
end
