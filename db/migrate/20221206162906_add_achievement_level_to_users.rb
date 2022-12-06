class AddAchievementLevelToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :achievement_level, :integer
  end
end
