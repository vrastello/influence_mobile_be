class AddDefaultToPlayHours < ActiveRecord::Migration[7.0]
  def change
    change_column_default :offer_details, :play_hours, from: nil, to: 0
  end
end
