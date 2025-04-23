# frozen_string_literal: true

require 'active_support/inflector'
require 'pathname'
require 'logger'
require 'sinatra/config_file'
require 'sinatra/custom_logger'

class BaseApp < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  set :secret, nil
  set :models_path, Pathname(__dir__).join('../models').expand_path
  set :apps_path, Pathname(__dir__).expand_path
  set :apps, '/' => 'UrlApp'

  configure :development do
    require 'sinatra/reloader'
    register Sinatra::Reloader
    also_reload settings.models_path.join('*.rb')
  end

  root = Pathname(settings.root)

  register Sinatra::ConfigFile
  config_file root.join('../config/application.yml')

  helpers Sinatra::CustomLogger
  configure do
    logfile = root.join("../log/#{settings.environment}.log").open('a')
    logfile.sync = true
    logger = Logger.new(logfile)
    logger.level = Logger.const_get(settings.log_level.upcase)
    set :logger, logger
    use ::Rack::CommonLogger, logger
  end
end
