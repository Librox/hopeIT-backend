# frozen_string_literal: true

class AddImagesToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :images, :json
  end
end
