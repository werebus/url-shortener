# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

ruby IO.read(File.expand_path('.ruby-version', __dir__)).strip

gem 'activerecord', require: 'active_record'
gem 'fancy_irb'
gem 'pg'
gem 'rake'
gem 'sinatra', require: 'sinatra/base'
gem 'sinatra-contrib', require: false
gem 'validate_url'
gem 'wirb'

group :development do
  gem 'pry'
  gem 'pry-byebug'
  gem 'rubocop'
end
