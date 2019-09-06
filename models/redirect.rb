# frozen_string_literal: true

class Redirect < ActiveRecord::Base
  validates :slug, :url, presence: true
  validates :slug, format: { with: /\A[a-z]+\z/ }
end
