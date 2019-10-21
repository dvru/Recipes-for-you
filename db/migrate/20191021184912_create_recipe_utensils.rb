class CreateRecipeUtensils < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_utensils do |t|
      t.integer :recipe_id
      t.integer :utensil_id

      t.timestamps
    end
  end
end
