Rails.application.routes.draw do
  get 'reviews/index'
  get 'reviews/show'
  get 'reviews/new'
  get 'reviews/create'
  get 'reviews/edit'
  get 'reviews/update'
  get 'reviews/destroy'
  resources :recipes

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :utensils, :ingredients, :recipe_ingredients, :reviews
end
