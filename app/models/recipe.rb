class Recipe < ApplicationRecord
    has_many :recipe_ingredients 
    has_many :ingredients, through: :recipe_ingredients

    has_many :recipe_utensils
    has_many :utensils, through: :recipe_utensils
    ####################################################
    belongs_to :user 
    
    has_many :reviews
    # has_many :users, through: :reviews

    accepts_nested_attributes_for :ingredients, :recipe_ingredients, :recipe_utensils, 
    :utensils, :allow_destroy => true
    validates :title, uniqueness: { case_sensitive: false }, presence: true 
    validates :description, :cook_time, presence: true

end
