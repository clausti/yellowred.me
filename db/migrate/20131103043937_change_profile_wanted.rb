class ChangeProfileWanted < ActiveRecord::Migration
  def up
    remove_column :profiles, :both_wanted
    remove_column :profiles, :any_wanted
    
    add_column :profiles, :nonbinary_wanted, :boolean, :default => false
  end

  def down
    remove_column :profiles, :nonbinary_wanted
    
    add_column :profiles, :both_wanted, :boolean, :default => false
    add_column :profiles, :any_wanted, :boolean, :default => false
  end
end
