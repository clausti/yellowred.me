class AddUserIdToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :user_id, :integer
    add_index :profiles, :user_id, :unique => true
    
    change_column :profiles, :user_id, :integer, :null => false
  end
end
