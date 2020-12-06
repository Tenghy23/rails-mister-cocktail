class Cocktail < ApplicationRecord
  # Cocktail holds many instances of Doses
  # If Cocktail is destroyed, the Doses dependant on Cocktail will be destroyed as well
  # Even though cocktail belongs to doses, it holds many ingredients. We declare it using though: to associate
  # Cocktail and Ingredient even though their tables are not connected. Thus, we can call @Cocktail.ingredient 
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses

  # Validation allows model to be created if it is unique and it is true (present)
  validates :name, uniqueness: true
  validates :name, presence: true

  has_one_attached :photo
end
