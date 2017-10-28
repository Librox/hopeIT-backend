# frozen_string_literal: true

class ChangeTitleAndContentToNotFalse < ActiveRecord::Migration[5.1]
  def change
    change_column_null :messages, :title, false
    change_column_null :messages, :content, false
    change_column_null :messages, :admin_id, false
    change_column_null :messages, :donor_id, false
  end
end
