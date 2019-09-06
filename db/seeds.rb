# frozen_string_literal: true

require 'pathname'

models = Pathname(__dir__).expand_path.join('..', 'models')
models.glob('*.rb').sort.each do |model|
  require model
end

Redirect.create(slug: 'a', url: 'https://github.com/werebus/url-shortener')
