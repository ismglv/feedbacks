# frozen_string_literal: true

class AddPgTrgmExtensionToDb < ActiveRecord::Migration[5.1]
  def change
    execute 'create extension pg_trgm;'
    add_index :feedbacks, :name
    add_index :feedbacks, :email
    add_index :feedbacks, :text
  end
end
