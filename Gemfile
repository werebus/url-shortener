# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

ruby IO.read(File.expand_path('.ruby-version', __dir__)).strip

gem 'activerecord'
gem 'pg'
gem 'rake'
gem 'sinatra'
gem 'sinatra-contrib'

group :development do
  gem 'rubocop'
end
