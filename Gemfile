# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'factory_bot_rails'
gem 'pg', '~> 0.18', '< 2.0'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.1.5'
gem 'rspec-rails'
gem 'sass-rails', '~> 5.0'
gem 'slim-rails'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker'
gem 'virtus'

group :development, :test do
  gem 'pry-rails'
  gem 'byebug', platform: %i[mri mingw x64_mingw]
  gem 'bundler-audit', require: false
  gem 'brakeman', require: false
end

group :development do
  gem 'bullet'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rubocop', require: false
  gem 'overcommit'
  gem 'foreman'
  gem 'scss_lint', require: false
end

group :test do
  gem 'capybara'
  gem 'chromedriver-helper'
  gem 'selenium-webdriver'
end
