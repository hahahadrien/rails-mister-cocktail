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



file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')
article = Article.new(title: 'NES', body: "A great console")
article.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')


# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")

# Cocktail.create(name: "Gin tonic")
# Cocktail.create(name: "Moscow mule")
# Cocktail.create(name: "Cuba libre")

# Dose.create(cocktail_id: 1, ingredient_id: 1, description: "3 cl")
# Dose.create(cocktail_id: 1, ingredient_id: 8, description: "10 cl")
# Dose.create(cocktail_id: 2, ingredient_id: 9, description: "2 cuillières à café")
# Dose.create(cocktail_id: 3, ingredient_id: 6, description: "venin de serpent")
# Dose.create(cocktail_id: 4, ingredient_id: 3, description: "poison")
