# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

puts "clearing database"

Cocktail.destroy_all
Dose.destroy_all
Ingredient.destroy_all

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients_read = open(url).read
ingredients = JSON.parse(ingredients_read)

puts "creating 100 fake ingredients"

ingredients["drinks"].each do |element|
  Ingredient.create!( name:element["strIngredient1"] )
end


