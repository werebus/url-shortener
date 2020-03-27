# frozen_string_literal: true

require 'active_support/inflector'
require 'bundler'
require 'pathname'
require 'sinatra/config_file'
require 'yaml'

class BaseApp < Sinatra::Base
  Bundler.require(:default, settings.environment)
  set :secret, nil
  set :models_path, Pathname(__dir__).join('models').expand_path
  set :apps_path, Pathname(__dir__).join('apps').expand_path
  set :apps, '/' => 'UrlApp'

  configure :development do
    require 'sinatra/reloader'
    register Sinatra::Reloader
    also_reload settings.models_path.join('*.rb')
  end

  root = Pathname(settings.root)

  register Sinatra::ConfigFile
  config_file root.join('config', 'application.yml')

  db_config = YAML.load_file root.join('config', 'database.yml')
  ActiveRecord::Base.configurations = db_config
  ActiveRecord::Base.establish_connection settings.environment
end

BaseApp.settings.models_path.glob('*.rb').sort.each do |model|
  require model
end

BaseApp.settings.apps.each do |path, app|
  require BaseApp.settings.apps_path.join("#{app.underscore}.rb").to_path
  map(path) { run app.constantize }
end
