# frozen_string_literal: true

class CategoryParams < Dry::Validation::Contract
  params do
    required(:category).hash do
      required(:name).filled(:string)
    end
  end

  rule("category.name") do
    key.failure(:must_be_unique) if Category.where(name: value).any?
  end
end
