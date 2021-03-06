Rails.application.routes.draw do
  resources :users
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get "uniqueness", to: 'ingredients#uniq_ingredients'
  get "uniqueness", to: 'utensils#uniq_utensils'
  resources :recipes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :utensils, :ingredients, :reviews
end
