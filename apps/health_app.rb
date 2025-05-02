# frozen_string_literal: true

class HealthApp < BaseApp
  get '/' do
    status 200
    json({ status: 'ok' })
  end

  post '/' do
    status 200
    json({ status: 'ok' })
  end
end
