# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :categories
  end
  namespace :api do
    namespace :v1 do
      resources :categories, only: %i[index]
    end
  end
end
