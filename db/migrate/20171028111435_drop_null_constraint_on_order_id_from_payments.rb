# frozen_string_literal: true

class DropNullConstraintOnOrderIdFromPayments < ActiveRecord::Migration[5.1]
  def change
    change_column_null :payments, :order_id, from: false, to: true
  end
end
