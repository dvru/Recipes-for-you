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
    @recipe = Recipe.new
  end

  def create
    @user_id = session[:user_id]
    @recipe = Recipe.new(recipe_params)

    if params[:add_ingredient]
      @recipe.ingredients.build
    elsif params[:remove_ingredient]

    elsif params[:add_utensil]
        @recipe.utensils.build
    elsif params[:remove_utensil]

    else
      # at this point its saved 
      #now onto the ifstatement
      if @recipe.save
        flash[:notice] = "Successfully created recipe."
        redirect_to @recipe and return
      end
    end
    render :action => 'new'
  end

  def edit
  end

  def update
    @user_id = session[:user_id]

    if params[:add_ingredient]
    	# rebuild the ingredient attributes that doesn't have an id
    	unless params[:recipe][:ingredients_attributes].blank?
	      for attribute in params[:recipe][:ingredients_attributes]
	        @recipe.ingredients.build(attribute.last.except(:_destroy)) unless attribute.last.has_key?(:id)
	      end
    	end
      # add one more empty ingredient attribute
      @recipe.ingredients.build
    elsif params[:remove_ingredient]
      # collect all marked for delete ingredient ids
      removed_ingredients = recipe_params[:ingredients_attributes].to_hash.collect { |i, att| att['id'] if (att['id'] && att[:_destroy].to_i == 1) }
      # physically delete the ingredients from database
      Ingredient.delete(removed_ingredients)
      flash[:notice] = "Ingredients removed."
      for attribute in recipe_params[:ingredients_attributes]
      	# rebuild ingredients attributes that doesn't have an id and its _destroy attribute is not 1
        @recipe.ingredients.build(attribute.last.except(:_destroy)) if (!attribute.last.has_key?(:id) && attribute.last[:_destroy].to_i == 0)
      end

    elsif params[:add_utensil]
        unless recipe_params[:utensils_attributes].blank?
          for attribute in recipe_params[:utensils_attributes]
            @recipe.utensils.build(attribute.last.except(:_destroy)) unless attribute.last.has_key?(:id)
          end
        end
        # add one more empty ingredient attribute
        @recipe.utensils.build
    elsif params[:remove_utensil]
        # collect all marked for delete ingredient ids
        removed_utensils = recipe_params[:utensils_attributes].to_hash.collect { |i, att| att['id'] if (att['id'] && att[:_destroy].to_i == 1) }
        # physically delete the ingredients from database
        Utensil.delete(removed_utensils)
        flash[:notice] = "Utensils removed."
        for attribute in recipe_params[:utensils_attributes]
          # rebuild ingredients attributes that doesn't have an id and its _destroy attribute is not 1
          @recipe.utensils.build(attribute.last.except(:_destroy)) if (!attribute.last.has_key?(:id) && attribute.last[:_destroy].to_i == 0)
        end
    else
      # save 
      if @recipe.update_attributes(recipe_params)
        flash[:notice] = "Successfully updated recipe."
        redirect_to @recipe and return
      end
    end
    render :action => 'edit'
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path
  end

  private
  def current_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :description, :user_id , :cook_time,
      ingredients_attributes: {}, utensils_attributes: {})
  end

end
