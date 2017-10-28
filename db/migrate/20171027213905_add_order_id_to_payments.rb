# frozen_string_literal: true

class AddOrderIdToPayments < ActiveRecord::Migration[5.1]
  def change
    add_column :payments, :order_id, :string, null: false, default: ""
    add_index :payments, :order_id, unique: true
  end
end
