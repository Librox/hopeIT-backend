# frozen_string_literal: true

class AddAmountToPayments < ActiveRecord::Migration[5.1]
  def change
    add_column :payments, :amount, :integer, null: false, default: 0
  end
end
