class CreateAgeGroup < ActiveRecord::Migration[7.0]
  def change
    create_table :age_groups do |t|
      t.integer :start_age
      t.integer :end_age

      t.timestamps
    end
  end
end
