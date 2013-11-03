class CreateNopes < ActiveRecord::Migration
  def change
    create_table :nopes do |t|
      t.integer :user_id, :null => false
      t.integer :profile_id, :null => false

      t.timestamps
    end
    
    add_index :nopes, [:user_id, :profile_id], :unique => true
  end
end
