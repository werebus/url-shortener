# frozen_string_literal: true

require 'kamal'

class Kamal::Configuration::Ssh
  def user
    ssh_config.fetch('user') do
      Net::SSH::Config.for('apps.wereb.us').fetch(:user, ENV['USER'])
    end
  end
end
