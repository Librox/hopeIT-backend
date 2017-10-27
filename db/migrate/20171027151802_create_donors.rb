# frozen_string_literal: true

class CreateDonors < ActiveRecord::Migration[5.1]
  def change
    create_table :donors do |t|
      t.string :name, null: false, default: ""
      t.string :mail, null: false, default: ""

      t.timestamps
    end
  end
end
