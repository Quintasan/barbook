# frozen_string_literal: true

module Api
  module V1
    class CategoriesController < ApiController
      expose(:categories) { Category.all }
      expose(:category)

      def index; end
    end
  end
end
