class AddAboutUsToOrganizations < ActiveRecord::Migration[7.0]
  def change
    add_column :organizations, :about_us, :text
  end
end
