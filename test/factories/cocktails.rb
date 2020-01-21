# frozen_string_literal: true

FactoryBot.define do
  factory :cocktail do
    sequence(:name) { |n| "Cocktail ##{n}" }
    ingredients { "MyText" }
    glassware { "MyString" }
    technique { "MyText" }
    garnish { "MyString" }
    signature { false }
    menu { false }

    association :category
  end
end
