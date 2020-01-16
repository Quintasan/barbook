# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :categories
    resources :cocktails
  end

  namespace :api do
    namespace :v1 do
      resources :categories, only: %i[index]
      resources :cocktails, only: %i[index show]
    end
  end
end
