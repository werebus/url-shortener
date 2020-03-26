# frozen_string_literal: true

require 'uri'
require 'json'
require 'sinatra/json'

class UrlApp < BaseApp
  set :secret, nil

  get %r{/([a-z]*)} do |slug|
    r = Redirect.find_by_slug(slug)
    if r.present?
      Redirect.increment_counter(:hits, r.id)
      redirect r.url, 301
    else
      url = URI.join(settings.default_url, slug)
      redirect url.to_s, 301
    end
  end

  post '/' do
    if request.content_length.to_i > 0
      request.body.rewind
      params.merge! JSON.parse(request.body.read)
    end
    require_key
    json Redirect.where(url: params[:url]).first_or_create
  end

  private

  def require_key
    return unless settings.secret?

    halt 401, 'Bad Key' unless params[:key] == settings.secret
  end
end
