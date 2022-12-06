class AddCarpoolToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :wants_to_carpool, :boolean
  end
end
