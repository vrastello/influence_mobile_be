class CreateOfferDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :offer_details do |t|
      t.references :offer, null: false, foreign_key: false, index: true
      t.integer :start_age
      t.integer :end_age
      t.integer :play_hours

      t.timestamps
    end
  end
end
