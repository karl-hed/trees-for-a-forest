class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :chatrooms do |t|
      t.integer :first_user_id
      t.integer :second_user_id
    end

    create_table :messages do |t|
      t.references :chatroom, foreign_key: true
      t.text :content
      t.integer :sender_id

      t.timestamps
    end
  end
end
