class AddPreferToMaybes < ActiveRecord::Migration
  def change
    add_column :maybes, :prefer, :boolean, :default => true
    add_index :maybes, :prefer
  end
end
