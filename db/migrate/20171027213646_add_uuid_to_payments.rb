# frozen_string_literal: true

class AddUuidToPayments < ActiveRecord::Migration[5.1]
  def change
    add_column :payments, :payment_uuid, :string, null: false, default: ""
    add_index :payments, :payment_uuid, unique: true
  end
end
