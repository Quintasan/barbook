# frozen_string_literal: true

module Api
  module V1
    class CocktailsController < ApiController
      expose(:cocktails) { Cocktail.all }
      expose(:cocktail)

      def index; end

      def show; end
    end
  end
end
