# frozen_string_literal: true

class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false, default: ""

      t.timestamps
    end

    add_index :categories, :name, unique: true
  end
end
