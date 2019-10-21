class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :description
      t.integer :user_id
      t.integer :review_id
      t.integer :cook_time

      t.timestamps
    end
  end
end
