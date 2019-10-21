class Recipe < ApplicationRecord
    belongs_to :user 
    belongs_to :review
    has_many :recipe_ingredients 
    has_many :ingredients, through: :recipe_ingredients
    has_many :recipe_utensils
    has_many :utensils, through: :recipe_utensils
end
