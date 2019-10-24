class Recipe < ApplicationRecord
    has_many :recipe_ingredients 
    has_many :ingredients, through: :recipe_ingredients
    has_many :recipe_utensils
    has_many :utensils, through: :recipe_utensils
    ####################################################
    belongs_to :user 
    
    has_many :reviews
    has_many :users, through: :reviews

 
    
end
