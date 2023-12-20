class AddGenderToOfferDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :offer_details, :gender, :string, array: true, default: []
  end
end
