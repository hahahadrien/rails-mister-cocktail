# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# db/seeds.rb
# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")

require "open-uri"
require "json"

puts "Deleting all records"
Ingredient.delete_all

puts "Seeding all ingredients from JSON file"
response = open("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").read
data = JSON.parse(response)
data["drinks"].each do |item|
  ingredient = Ingredient.new(
    name: item["strIngredient1"]
  )
  ingredient.save!
end
puts "All done :)"
