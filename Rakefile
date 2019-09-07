# frozen_string_literal: true

require 'yaml'
require 'logger'
require 'pathname'

require 'bundler'
env = ENV['RACK_ENV'] || 'development'
Bundler.require(:default, env)

include ActiveRecord::Tasks

class Seeder
  def initialize(seed)
    @seed = seed
  end

  def load_seed
    raise "Seed file '#{@seed}' does not exist" unless File.file? @seed

    load @seed
  end
end

root = Pathname(__dir__).expand_path

DatabaseTasks.env = env
conf = root.join('config', 'database.yml')
DatabaseTasks.database_configuration = YAML.load_file(conf)
DatabaseTasks.db_dir = root.join 'db'
# DatabaseTasks.fixtures_path = root.join('test', 'fixtures')
DatabaseTasks.migrations_paths = [root.join('db', 'migrate')]
DatabaseTasks.seed_loader = Seeder.new root.join('db', 'seeds.rb')
DatabaseTasks.root = root

task :environment do
  ActiveRecord::Base.configurations = DatabaseTasks.database_configuration
  ActiveRecord::Base.establish_connection DatabaseTasks.env.to_sym
end

load 'active_record/railties/databases.rake'
