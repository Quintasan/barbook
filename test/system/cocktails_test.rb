# frozen_string_literal: true

require "application_system_test_case"

class CocktailsTest < ApplicationSystemTestCase
  setup do
    @category = create(:category)
    @cocktail = create(:cocktail)
    @new_cocktail_attributes = build(:cocktail)
  end

  test "visiting the index" do
    visit admin_cocktails_url
    assert_selector "h1", text: "Listing cocktails"
  end

  test "creating a Cocktail" do
    visit admin_cocktails_url
    click_on "New Cocktail"

    fill_in "Garnish", with: @new_cocktail_attributes.garnish
    fill_in "Glassware", with: @new_cocktail_attributes.glassware
    fill_in "Ingredients", with: @new_cocktail_attributes.ingredients
    select @category.name, from: "cocktail_category_id"
    check "Menu" if @new_cocktail_attributes.menu
    fill_in "Name", with: @new_cocktail_attributes.name
    check "Signature" if @new_cocktail_attributes.signature
    fill_in "Technique", with: @new_cocktail_attributes.technique
    click_on "Save"

    assert_text "Cocktail was successfully created"
    click_on "Back"
  end

  test "updating a Cocktail" do
    visit admin_cocktails_url
    click_on "Edit", match: :first

    fill_in "Garnish", with: @cocktail.garnish
    fill_in "Glassware", with: @cocktail.glassware
    fill_in "Ingredients", with: @cocktail.ingredients
    select @category.name, from: "cocktail_category_id"
    check "Menu" if @cocktail.menu
    fill_in "Name", with: @cocktail.name
    check "Signature" if @cocktail.signature
    fill_in "Technique", with: @cocktail.technique
    click_on "Save"

    assert_text "Cocktail was successfully updated"
    click_on "Back"
  end

  test "destroying a Cocktail" do
    visit admin_cocktails_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cocktail was successfully destroyed"
  end
end
