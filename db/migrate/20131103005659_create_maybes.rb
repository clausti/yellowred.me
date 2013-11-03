class CreateMaybes < ActiveRecord::Migration
  def change
    create_table :maybes do |t|
      t.integer :user_id, :null => false
      t.integer :profile_id, :null => false

      t.timestamps
    end
    
    add_index :maybes, [:user_id, :profile_id], :unique => true
  end
end
