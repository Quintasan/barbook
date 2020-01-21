# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'anyway_config', git: 'https://github.com/palkan/anyway_config', branch: 'master'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'decent_exposure'
gem 'dry-validation'
gem 'hamlit'
gem 'hamlit-rails'
gem "image_processing", "~> 1.8"
gem 'jb'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.2'
gem 'shrine', '~> 3.0'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'awesome_print'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot'
  gem 'factory_bot_rails'
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'sqlite3', '~> 1.4'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'relaxed-rubocop'
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
