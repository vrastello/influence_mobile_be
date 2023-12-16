class AddPayoutToOffers < ActiveRecord::Migration[7.0]
  def change
    add_column :offers, :payout, :integer
  end
end
