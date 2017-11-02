# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
list = JSON.parse(ingredients_serialized)

drinks = list.flatten.drop(1)
n = 0
drinks.each do |hash|
  hash.each do |hash|
    hash.each_value do |value|
      Ingredient.create({name: value})
    end
  end
end

