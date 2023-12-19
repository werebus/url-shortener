# frozen_string_literal: true

source 'https://rubygems.org'

ruby file: '.ruby-version'

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
  gem 'bcrypt_pbkdf'
  gem 'capistrano', '~> 3.12', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-passenger', require: false
  gem 'capistrano-pending', require: false
  gem 'capistrano-rails', require: false
  gem 'ed25519'
  gem 'pry'
  gem 'pry-byebug'
  gem 'rubocop'
  gem 'rubocop-rake'
end
