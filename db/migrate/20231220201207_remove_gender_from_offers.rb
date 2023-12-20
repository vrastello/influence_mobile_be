class RemoveGenderFromOffers < ActiveRecord::Migration[7.0]
  def change
    remove_column :offers, :gender, :string, array: true, default: []
  end
end
