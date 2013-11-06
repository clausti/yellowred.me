class DropNopes < ActiveRecord::Migration
  def up
    drop_table :nopes
  end

  def down
    create_table :nopes do |t|
      t.integer :user_id, :null => false
      t.integer :profile_id, :null => false

      t.timestamps
    end
    
    add_index :nopes, [:user_id, :profile_id], :unique => true
  end
end
