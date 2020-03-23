# frozen_string_literal: true

require 'pathname'
require 'yaml'
require 'bundler'
require 'sinatra/config_file'

class BaseApp < Sinatra::Base
  Bundler.require(:default, settings.environment)
  set :secret, nil

  configure :development do
    require 'sinatra/reloader'
    register Sinatra::Reloader
  end

  root = Pathname(settings.root)

  register Sinatra::ConfigFile
  config_file root.join('config', 'application.yml')

  db_config = YAML.load_file root.join('config', 'database.yml')
  ActiveRecord::Base.configurations = db_config
  ActiveRecord::Base.establish_connection settings.environment
end

Pathname(__dir__).join('models').glob('*.rb').sort.each do |model|
  require model
end

Pathname(__dir__).join('apps').glob('*.rb').sort.each do |app|
  require app
end

map '/' do
  run UrlApp
end
