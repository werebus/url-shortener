# frozen_string_literal: true

%w[setup deploy scm/git bundler rails/migrations passenger pending].each do |lib|
  require "capistrano/#{lib}"
end
install_plugin Capistrano::SCM::Git
