# frozen_string_literal: true

class AddIndexToRedirects < ActiveRecord::Migration[6.0]
  def change
    add_index :redirects, :slug
  end
end
