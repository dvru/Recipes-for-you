class User < ApplicationRecord
    #has_many :recipes
    has_many :reviews
    has_many :recipes
    


validates :name, uniqueness: { case_sensitive: true }, presence: true 
has_secure_password

end
