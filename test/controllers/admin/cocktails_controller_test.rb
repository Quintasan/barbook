# frozen_string_literal: true

require 'test_helper'

class CocktailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = create(:category)
    @cocktail = create(:cocktail, category: @category)
  end

  test "should get index" do
    get admin_cocktails_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_cocktail_url
    assert_response :success
  end

  test "should create cocktail" do
    assert_difference('Cocktail.count') do
      post admin_cocktails_url, params: { cocktail: attributes_for(:cocktail).merge(category_id: @category.id) }
    end

    assert_redirected_to admin_cocktail_url(Cocktail.last)
  end

  test "should show cocktail" do
    get admin_cocktail_url(@cocktail)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_cocktail_url(@cocktail)
    assert_response :success
  end

  test "should update cocktail" do
    patch admin_cocktail_url(@cocktail), params: { cocktail: attributes_for(:cocktail) }
    assert_redirected_to admin_cocktail_url(@cocktail)
  end

  test "should destroy cocktail" do
    assert_difference('Cocktail.count', -1) do
      delete admin_cocktail_url(@cocktail)
    end

    assert_redirected_to admin_cocktails_url
  end
end
