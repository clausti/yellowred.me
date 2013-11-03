class CreateStars < ActiveRecord::Migration
  def change
    create_table :stars do |t|
      t.integer :user_id, :null => false
      t.integer :profile_id, :null => false

      t.timestamps
    end
    
    add_index :stars, [:user_id, :profile_id], :unique => true
  end
end