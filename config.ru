# frozen_string_literal: true

require 'bundler'
require 'pathname'

env = ENV.fetch 'RACK_ENV', 'development'
Bundler.require :default, env

require_relative Pathname(__dir__).join('apps/base_app').expand_path

BaseApp.settings.models_path.glob('*.rb').sort.each do |model|
  require model
end

BaseApp.settings.apps.each do |path, app|
  require BaseApp.settings.apps_path.join("#{app.underscore}.rb").to_path
  map(path) { run app.constantize }
end
