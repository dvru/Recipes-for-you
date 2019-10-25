class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def new
    @ingredient = Ingredient.new
  end

def create 
  @ingredient= Ingredient.new(ingredient_params)

  if @ingredient.valid?
      @ingredient.save
      redirect_to ingredient_path(@ingredient) 
  else 
      flash[:errors] = @ingredient.errors.full_messages
      redirect_to new_ingredient_path
  end 
end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update 
    @ingredient = Ingredient.find(params[:id])
    @ingredient.update(ingredient_params)
    redirect_to ingredient_path(@ingredient)
end

def destroy 
  @ingredient = Ingredient.find(params[:id])
  @ingredient.destroy 
  redirect_to ingredients_path
end 

def uniq_ingredients
  @ingredients = Ingredient.all
  @ingredient_arr = []
    @ingredients.each do |ingredient|
      @ingredient_arr << ingredient.name
    end
  @ingredient_names = @ingredient_arr.uniq
end

  private

def ingredient_params
    params.require(:ingredient).permit(:name, :quantity, :measurement_type)
end 

end