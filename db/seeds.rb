# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do
  cocktail = Cocktail.new(name: Faker::Beer.name)
  cocktail.save
  puts 'cocktail saved!'
  ingredient = Ingredient.new(name: Faker::Dessert.topping)
  ingredient.save
  puts 'ingredient saved!'
  dose = Dose.new(description: Faker::Measurement.volume)
  # Dose contains both a cocktail & ingredient instance, hence we must assign them
  dose.cocktail = cocktail # Assign Cocktail instance to Dose
  dose.ingredient = ingredient # Assign Ingredient instance to Dose
  dose.save
  puts 'dose save'  
end

## API method to seed data
# require 'json'
# require 'open-uri'

# url = 'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita'

# data = open(url).read

# alcohol = JSON.parse(data)

# alcohol['drinks'].each do |params|
#   cocktail = Cocktail.new(name: params['strDrink'])
#   cocktail.save
#   ingredient = Ingredient.new(name: params['strGlass'])
#   ingredient.save
#   dose = Dose.new(description: params['strInstructions'])
#   dose.cocktail = cocktail
#   dose.ingredient = ingredient
#   dose.save
#   puts 'saved set'
# end

# puts 'youre muthafookin done w seeding'
