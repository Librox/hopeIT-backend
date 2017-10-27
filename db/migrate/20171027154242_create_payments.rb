# frozen_string_literal: true

class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.references :donation, foreign_key: true

      t.timestamps
    end
  end
end
