# frozen_string_literal: true

source 'https://rubygems.org'

ruby file: '.ruby-version'

gem 'activerecord', require: 'active_record'
gem 'activesupport', require: 'active_support'
gem 'irb'
gem 'pg'
gem 'puma'
gem 'rackup'
gem 'rails', '~> 7.2.2', install_if: false
gem 'rake'
gem 'sinatra', require: 'sinatra/base'
gem 'sinatra-activerecord', require: 'sinatra/activerecord'
gem 'sinatra-contrib', require: false
gem 'sinatra-cors', require: 'sinatra/cors'
gem 'thruster', require: false
gem 'validate_url'

group :development do
  gem 'bcrypt_pbkdf'
  gem 'debug'
  gem 'dotenv', require: 'dotenv/load'
  gem 'ed25519'
  gem 'kamal', require: false
  gem 'rubocop'
  gem 'rubocop-rake'
end
