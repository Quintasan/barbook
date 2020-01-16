# frozen_string_literal: true

class CreateCocktails < ActiveRecord::Migration[6.0]
  def change
    create_table :cocktails do |t|
      t.string :name, null: false
      t.string :youtube_link, null: false, default: ""
      t.text :ingredients, null: false, default: ""
      t.string :glassware, null: false, default: ""
      t.text :technique, null: false, default: ""
      t.string :garnish, null: false, default: ""
      t.boolean :signature, null: false, default: false
      t.boolean :menu, null: false, default: false
      t.references :category, index: true

      t.timestamps
    end

    add_index :cocktails, :name, unique: true
  end
end
