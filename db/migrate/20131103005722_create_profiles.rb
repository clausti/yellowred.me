class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :username, :null => false
      t.string :gender, :null => false
      t.string :about_me, :null => false
      
      t.boolean :friends_wanted, :default => false
      t.boolean :dating_wanted, :default => false
      t.boolean :hookups_wanted, :default => false
      t.boolean :men_wanted, :default => false
      t.boolean :women_wanted, :default => false
      t.boolean :both_wanted, :default => false
      t.boolean :any_wanted, :default => false
      
      t.integer :height #in inches
      t.string :body_type
      t.string :religion
      t.string :education
      t.string :children
      t.string :pets

      t.timestamps
    end
    
    add_index :profiles, :username, :unique => true
  end
end
