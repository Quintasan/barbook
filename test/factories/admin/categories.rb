# frozen_string_literal: true

FactoryBot.define do
  factory :admin_category, class: 'Admin::Category' do
    name { "MyString" }
  end
end
