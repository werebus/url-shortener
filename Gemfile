# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

ruby IO.read(File.expand_path('.ruby-version', __dir__)).strip

gem 'activerecord', require: 'active_record'
gem 'activesupport', require: 'active_support'
gem 'pg'
gem 'puma'
gem 'rake'
gem 'sinatra', require: 'sinatra/base'
gem 'sinatra-contrib', require: false
gem 'sinatra-cors', require: 'sinatra/cors'
gem 'validate_url'

group :development do
  gem 'capistrano', '~> 3.12', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-passenger', require: false
  gem 'capistrano-pending', require: false
  gem 'capistrano-rails', require: false
  gem 'pry'
  gem 'pry-byebug'
  gem 'rubocop'
end
