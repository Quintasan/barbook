# frozen_string_literal: true

module Admin
  class CategoriesController < ApplicationController
    expose(:categories) { Category.all }
    expose(:category)

    def index; end

    def show; end

    def new; end

    def edit; end

    def create
      if category.save
        redirect_to category, notice: 'Category was successfully created.'
      else
        render :new
      end
    end

    def update
      if category_params.success?
        category.update(category_params.to_h[:category])
        redirect_to admin_category_url(category), notice: 'Category was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      category.destroy
      redirect_to admin_categories_url, notice: 'Category was successfully destroyed.'
    end

    private

    def category_params
      ::CategoryParams.new.call(params.to_unsafe_h)
    end
  end
end
