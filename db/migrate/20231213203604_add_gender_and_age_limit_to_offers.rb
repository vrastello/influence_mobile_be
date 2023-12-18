class AddGenderAndAgeLimitToOffers < ActiveRecord::Migration[7.0]
  def change
    add_column :offers, :gender, :string, array: true, default: []
    add_column :offers, :age_limit, :integer
  end
end
