# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients_data = open(url).read
parsed_ingr = JSON.parse(ingredients_data)

ingredients_array = []

parsed_ingr["drinks"].each do |ingredient|
  ingredients_array.push({ name: ingredient["strIngredient1"] })
end

puts 'Cleaning database...'
Ingredient.destroy_all

puts 'Creating ingredients...'
Ingredient.create!(ingredients_array)

puts 'Finished creating seed instances!'
