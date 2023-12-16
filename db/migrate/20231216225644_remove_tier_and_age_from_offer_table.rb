class RemoveTierAndAgeFromOfferTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :offers, :tier, :integer
    remove_column :offers, :age_limit, :integer
  end
end
