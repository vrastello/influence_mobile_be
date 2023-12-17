class AddNullFalseToRoleUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :role, :string, null: false
  end
end
