# frozen_string_literal: true

lock '~> 3.12'

set :application, 'url-shortener'
set :repo_url, 'https://github.com/werebus/url-shortener.git'
set :branch, 'main'

set :deploy_to, '/srv/url-shortener'

append :linked_files, 'config/database.yml'
append :linked_dirs, 'vendor/bundle'

set :migration_role, :app
set :capistrano_pending_role, :app

set :passenger_restart_with_touch, true
