# frozen_string_literal: true

class CreateRedirects < ActiveRecord::Migration[6.0]
  def change
    create_table :redirects do |t|
      t.string :slug, null: false
      t.string :url, null: false
      t.integer :hits, default: 0
      t.timestamps
    end
  end
end
