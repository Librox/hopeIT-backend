# frozen_string_literal: true

class AddAdminIdToMessages < ActiveRecord::Migration[5.1]
  def change
    add_reference :messages, :admin, foreign_key: true
  end
end
