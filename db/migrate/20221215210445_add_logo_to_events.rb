class AddLogoToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :logo, :string
  end
end
