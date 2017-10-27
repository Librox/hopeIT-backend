class CreateDonations < ActiveRecord::Migration[5.1]
  def change
    create_table :donations do |t|
      t.references :donation_type, foreign_key: true
      t.references :donor, foreign_key: true
      t.references :patient, foreign_key: true

      t.timestamps
    end
  end
end
