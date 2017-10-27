# frozen_string_literal: true

class CreateDonors < ActiveRecord::Migration[5.1]
  def change
    create_table :donors do |t|
      t.string :name, null: false, default: ""
      t.string :email, null: false, default: ""

      t.timestamps
    end
    add_index :donors, :email, unique: true
  end
end
