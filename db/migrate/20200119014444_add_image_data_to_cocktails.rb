# frozen_string_literal: true

class AddImageDataToCocktails < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :image_data, :text
  end
end
