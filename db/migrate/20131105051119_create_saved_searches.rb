class CreateSavedSearches < ActiveRecord::Migration
  def change
    create_table :saved_searches do |t|
      t.integer :user_id, :null => false
      t.string   :username
      t.string   :gender
      t.boolean  :friends_wanted
      t.boolean  :dating_wanted
      t.boolean  :hookups_wanted
      t.boolean  :men_wanted
      t.boolean  :women_wanted
      t.boolean  :nonbinary_wanted
      t.integer  :height
      t.string   :body_type
      t.string   :religion
      t.string   :education
      t.string   :children
      t.string   :pets

      t.timestamps
    end
    
    add_index :saved_searches, :user_id, :unique => true
  end
end
