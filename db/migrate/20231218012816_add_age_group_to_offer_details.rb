class AddAgeGroupToOfferDetails < ActiveRecord::Migration[7.0]
  def change
    add_reference :offer_details, :age_group, null: true, foreign_key: false, index: true
    add_column :offer_details, :disabled, :boolean, null: false, default: true
    add_column :age_groups, :name, :string, null: false
  end
end
