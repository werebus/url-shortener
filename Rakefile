# frozen_string_literal: true

require 'bundler'
require 'pathname'

env = ENV.fetch 'RACK_ENV', 'development'
Bundler.require :default, env

require 'sinatra/activerecord/rake'

namespace :db do
  task :load_config do
    require_relative Pathname(__dir__).join('apps/base_app').expand_path
  end
end
