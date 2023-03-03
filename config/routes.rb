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
end
