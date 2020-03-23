# frozen_string_literal: true

class Redirect < ActiveRecord::Base
  validates :slug, :url, presence: true
  validates :slug, format: { with: /\A[a-z]+\z/ }

  before_validation :assign_next_slug, on: :create, if: ->{ slug.blank? }

  private

  def assign_next_slug
    new_slug = Redirect.order(:slug).last.slug.succ
    loop do
      unless Redirect.exists?(slug: new_slug)
        self.slug = new_slug
        break
      end
      new_slug = new_slug.succ
    end
  end
end
