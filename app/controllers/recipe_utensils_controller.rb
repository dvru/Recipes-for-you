class RecipeUtensilsController < ApplicationController

def index
    @recipe_utensils = Recipe_Utensils.all 
  end

  def show
    @recipe_utensil = Recipe_Utensil.find(params[:id])
  end

  def new
    @recipe_utensil = Recipe_Utensil.new
  end

 
def create 
  @recipe_utensil = Recipe_Utensil.new(recipe_utensil_params)

  if @utensil.valid?
      @utensil.save 
      # buybug
      redirect_to utensil_path(@utensil) 
  else 
      flash[:errors] = @utensil.errors.full_messages
      redirect_to new_recipe_utensil_path
  end 
end

  def edit
    @recipe_utensil = Recipe_Utensil.find(params[:id])
  end

  def update 
    @recipe_utensil = Recipe_Utensil.find(params[:id])
    @recipe_utensil.update(recipe_utensil_params)
    redirect_to recipe_utensil_path(@recipe_utensil)
end

def destroy 
  @recipe_utensil = Recipe_Utensil.find(params[:id])
  @recipe_utensil.destroy 
  redirect_to recipe_utensils_path
end 

  private

def recipe_utensil_params
    params.require(:recipe_utensil).permit(:recipe, :utensil)
end 

end
