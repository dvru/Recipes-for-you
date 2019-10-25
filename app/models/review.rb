class Review < ApplicationRecord
   belongs_to :user
   belongs_to :recipe

   validates :rating, :comment, :recipe_id, presence: :true
end
