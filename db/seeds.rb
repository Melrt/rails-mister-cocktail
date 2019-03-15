# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning cocktails + doses database...'
Cocktail.destroy_all

puts 'Cleaning ingredient'
Ingredient.destroy_all

puts 'Creating ingredients...'

10.times do
  ingredient = Ingredient.new(
    name: Faker::Food.fruits
  )
  ingredient.save!
end

10.times do
  ingredient = Ingredient.new(
    name: Faker::Food.spice
  )
  ingredient.save!
end

puts 'Creating cocktails...'

6.times do
  # Créer un cocktail vide
  cocktail = Cocktail.new(
    name: Faker::Ancient.titan
  )
  cocktail.save!

  # Choisir 3 ingrédients
  ingredients = Ingredient.all
  cocktail_ingredients = ingredients.sample(3)

  # Créer 3 doses de ces ingrédients pour mon cocktail
  doses = cocktail_ingredients.map do |ingredient|
    Dose.create!(
      cocktail: cocktail,
      ingredient: ingredient,
      description: Faker::Food.measurement,
    )
  end
  # => [<Active# ingredient 1,,>, <Activ# ingredient 2...>]
end

puts 'Finished!'

