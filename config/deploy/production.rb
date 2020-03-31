# frozen_string_literal: true

server 'mm.vu', roles: %w[web app]
set :default_env, 'RACK_ENV' => fetch(:stage)
