# frozen_string_literal: true

require 'uri'

class UrlApp < BaseApp
  get %r{/([a-z]+)} do |slug|
    r = Redirect.find_by_slug(slug)
    if r.present?
      Redirect.increment_counter(:hits, r.id)
      redirect r.url, 301
    else
      url = URI.join(settings.default_url, slug)
      redirect url.to_s, 301
    end
  end

  get '/' do
    redirect settings.default_url, 301
  end
end
