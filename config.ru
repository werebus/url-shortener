# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'

require 'active_record'
require 'pathname'
require 'yaml'

$root = Pathname(__dir__).expand_path

class BaseApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  root   = $root
  env    = ENV['RACK_ENV'] || 'development'
  config = YAML.load_file root.join('config', 'database.yml')

  ActiveRecord::Base.configurations = config
  ActiveRecord::Base.establish_connection env.to_sym
end

$root.join('models').glob('*.rb').sort.each do |model|
  require model
end

$root.join('apps').glob('*.rb').sort.each do |app|
  require app
end

map '/' do
  run UrlApp
end
