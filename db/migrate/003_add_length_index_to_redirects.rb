# frozen_string_literal: true

class AddLengthIndexToRedirects < ActiveRecord::Migration[6.0]
  def change
    add_index :redirects, 'LENGTH(slug), slug',
      name: 'index_redirects_on_slug_order'
  end
end
