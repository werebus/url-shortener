# frozen_string_literal: true

class Redirect < ActiveRecord::Base
  validates :url, url: { no_local: true, public_suffix: true }
  validates :slug, format: { with: /\A[a-z]+\z/ }

  before_validation :assign_next_slug, on: :create, if: ->{ slug.blank? }

  scope :slug_order, -> { order('LENGTH(slug), slug') }

  private

  def assign_next_slug
    self.slug = Redirect.unscoped.slug_order.last.slug.succ
  end
end
