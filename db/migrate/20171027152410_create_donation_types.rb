# frozen_string_literal: true

class CreateDonationTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :donation_types do |t|
      t.string :name, null: false, default: ""

      t.timestamps
    end

    add_index :donation_types, :name, unique: true
  end
end
