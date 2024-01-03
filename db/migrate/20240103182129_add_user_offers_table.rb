class AddUserOffersTable < ActiveRecord::Migration[7.0]
  def change
    create_table :user_offers do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.references :offer_detail, null: false, foreign_key: true, index: true
    end
  end
end
