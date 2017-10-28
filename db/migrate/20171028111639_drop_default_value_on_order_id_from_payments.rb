# frozen_string_literal: true

class DropDefaultValueOnOrderIdFromPayments < ActiveRecord::Migration[5.1]
  def change
    change_column_default :payments, :order_id, from: "", to: nil
  end
end
