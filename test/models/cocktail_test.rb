# frozen_string_literal: true

require 'test_helper'

class CocktailTest < ActiveSupport::TestCase
  test "must have a valid factory" do
    cocktail = build(:cocktail)

    assert cocktail.valid?
  end

  test "must have a name" do
    nil_as_name = build(:cocktail, name: nil)
    empty_string_as_name = build(:cocktail, name: "")

    assert_not nil_as_name.valid?
    assert_not empty_string_as_name.valid?
  end

  test "must be unique" do
    existing_cocktail = create(:cocktail)
    new_cocktail = build(:cocktail, name: existing_cocktail.name)

    assert_not new_cocktail.valid?
  end

  test "can have some ingredients" do
    empty_string_as_ingredients = build(:cocktail, ingredients: "")
    nil_as_ingredients = build(:cocktail, ingredients: nil)

    assert empty_string_as_ingredients.valid?
    assert nil_as_ingredients.valid?
  end

  test "can be served in some glassware" do
    empty_string_as_glassware = build(:cocktail, glassware: "")
    nil_as_glassware = build(:cocktail, glassware: nil)

    assert empty_string_as_glassware.valid?
    assert nil_as_glassware.valid?
  end

  test "can have some serving technique" do
    empty_string_as_technique = build(:cocktail, technique: "")
    nil_as_technique = build(:cocktail, technique: nil)

    assert empty_string_as_technique.valid?
    assert nil_as_technique.valid?
  end

  test "can be garnished" do
    empty_string_as_garnish = build(:cocktail, garnish: "")
    nil_as_garnish = build(:cocktail, garnish: nil)

    assert empty_string_as_garnish.valid?
    assert nil_as_garnish.valid?
  end

  test "must be either signature cocktail or not" do
    nil_as_signature = build(:cocktail, signature: nil)

    assert_not nil_as_signature.valid?
  end

  test "must be either cocktail from the menu or not" do
    nil_as_menu = build(:cocktail, menu: nil)

    assert_not nil_as_menu.valid?
  end
end
