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
  puts "cocktail saved!"
  ingredient = Ingredient.new(name: Faker::Dessert.topping)
  ingredient.save
  puts "ingredient saved!"
  dose = Dose.new(description: Faker::Measurement.volume)
  dose.cocktail = cocktail
  dose.ingredient = ingredient
  dose.save
  puts "dose save"
end

puts 'youre muthafookin done w seeding'
