class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.date :date
      t.time :time
      t.float :latitude
      t.float :longitude
      t.string :region
      t.integer :capacity
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
