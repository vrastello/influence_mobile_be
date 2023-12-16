class AddTierToOffers < ActiveRecord::Migration[7.0]
  def change
    add_column :offers, :tier, :integer
  end
end
