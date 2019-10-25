Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  # get ‘signup’, to: ‘users#new’, as: ‘signup’
  # get ‘login’, to: ‘sessions#new’, as: ‘login’
  # get ‘logout’, to: ‘sessions#destroy’, as: ‘logout’
  get "uniqueness", to: 'ingredients#uniq_ingredients'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :recipes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :utensils, :ingredients, :reviews
end
