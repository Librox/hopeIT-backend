# frozen_string_literal: true

class AddStatusToPayment < ActiveRecord::Migration[5.1]
  def change
    add_column :payments, :status, :string, null: false, default: "pending"
  end
end
