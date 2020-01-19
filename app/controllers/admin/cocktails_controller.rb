# frozen_string_literal: true

module Admin
  class CocktailsController < ApplicationController
    expose(:cocktails) { Cocktail.all }
    expose(:cocktail)

    def index; end

    def show; end

    def new; end

    def edit; end

    def create
      if cocktail.valid?
        cocktail.image_derivatives! if cocktail.image_changed?
        cocktail.save
        redirect_to admin_cocktail_path(cocktail), notice: 'Cocktail was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /cocktails/1
    def update
      if cocktail.update(cocktail_params)
        cocktail.image_derivatives! if cocktail.image_changed?
        cocktail.save
        redirect_to admin_cocktail_path(cocktail), notice: 'Cocktail was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      cocktail.destroy
      redirect_to cocktails_url, notice: 'Cocktail was successfully destroyed.'
    end

    private

    def cocktail_params
      params.require(:cocktail).permit(
        :name,
        :ingredients,
        :glassware,
        :technique,
        :garnish,
        :signature,
        :menu,
        :category_id,
        :youtube_link,
        :image
      )
    end
  end
end
