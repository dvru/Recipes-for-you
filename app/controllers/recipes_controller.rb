class RecipesController < ApplicationController

  before_action :current_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
    
  end

  def show

    total_rate = 0.0
    @recipe.reviews.each do |i|
      total_rate += i.rating
    end
    @avg_rate = total_rate/@recipe.reviews.count
  end

  def new
  
  end

  def edit

  end

  private
  def current_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :description, :user_id, :review_id, :cook_time)
  end

end
