# frozen_string_literal: true

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "must have a valid factory" do
    category = build(:category)

    assert category.valid?
  end

  test "must have a name" do
    nil_as_name = build(:category, name: nil)
    empty_string_as_name = build(:category, name: "")

    assert_not nil_as_name.valid?
    assert_not empty_string_as_name.valid?
  end

  test "must be unique" do
    existing_category = create(:category)
    new_category = build(:category, name: existing_category.name)

    assert_not new_category.valid?
  end
end
