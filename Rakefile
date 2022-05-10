# frozen_string_literal: true

require 'yaml'
require 'logger'
require 'pathname'

require 'bundler'
env = ENV.fetch 'RACK_ENV', 'development'
Bundler.require :default, env

class Seeder
  def initialize(seed)
    @seed = seed
  end

  def load_seed
    raise "Seed file '#{@seed}' does not exist" unless File.file? @seed

    load @seed
  end
end

db_tasks = ActiveRecord::Tasks::DatabaseTasks.tap do |db|
  root = Pathname(__dir__).expand_path

  db.env = env
  db.database_configuration = YAML.load_file root.join('config', 'database.yml')
  db.db_dir = root.join 'db'
  db.migrations_paths = [root.join('db', 'migrate')]
  db.seed_loader = Seeder.new root.join('db', 'seeds.rb')
  db.root = root
end

desc 'Load the aplication environment (connect to the database)'
task :environment do
  ActiveRecord::Base.configurations = db_tasks.database_configuration
  ActiveRecord::Base.establish_connection db_tasks.env.to_sym
end

load 'active_record/railties/databases.rake'
