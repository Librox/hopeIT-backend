# frozen_string_literal: true

class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.string :name, null: false, default: ""
      t.text :description, null: false, default: ""
      t.string :photo, null: false, default: ""

      t.timestamps
    end
  end
end
