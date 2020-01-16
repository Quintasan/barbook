# frozen_string_literal: true

vodka = Category.find_or_create_by(name: "Vodka")
rum = Category.find_or_create_by(name: "Rum")
gin = Category.find_or_create_by(name: "Gin")
whisky = Category.find_or_create_by(name: "Whisky")

Cocktail.find_or_create_by(name: "Moscow Mule") do |cocktail|
  cocktail.category = vodka
end

Cocktail.find_or_create_by(name: "Cuba Libre") do |cocktail|
  cocktail.category = rum
end

Cocktail.find_or_create_by(name: "Gin Fizz") do |cocktail|
  cocktail.category = gin
end

Cocktail.find_or_create_by(name: "Whisky Sour") do |cocktail|
  cocktail.category = whisky
end
