class AddMoreToOffers < ActiveRecord::Migration[7.0]
  def change
    add_column :offers, :genre, :string
    add_column :offers, :title, :string
  end
end
