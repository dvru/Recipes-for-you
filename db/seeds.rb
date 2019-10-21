# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Utensil.destroy_all
Ingredient.destroy_all 
Review.destroy_all
Recipe.destroy_all
RecipeIngredient.destroy_all
RecipeUtensil.destroy_all


us1 = User.create(name: 'Steven', password: 'happy')
us2 = User.create(name: 'Damini', password: 'sad')

ut1 = Utensil.create(name: 'Knife')
ut2 = Utensil.create(name: 'Pot')

i1 = Ingredient.create(name: 'Salt', quantity: 1, measurement_type: 'Teaspoon')
i2 = Ingredient.create(name: 'Flour', quantity: 1, measurement_type: 'Cup')

rev1 = Review.create(rating: 2, comment: 'eh!')
rev2 = Review.create(rating: 5, comment: 'Great!')


rec1 = Recipe.create(title: 'Pasta', description: 'throw it in the pot', user_id: us1.id,
     review_id: rev1.id, cook_time: 5)
rec2 = Recipe.create(title: 'Bread', description: 'throw it in the oven', user_id: us2.id,
    review_id: rev2.id, cook_time: 20)


recU1 = RecipeUtensil.create(recipe_id: rec1.id, utensil_id: ut1.id)
recU2 = RecipeUtensil.create(recipe_id: rec2.id, utensil_id: ut2.id)
    
    
recI1 = RecipeIngredient.create(recipe_id: rec1.id, ingredient_id: i1.id)
recI2 = RecipeIngredient.create(recipe_id: rec2.id, ingredient_id: i2.id)










