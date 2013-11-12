class RemoveStarsCountFromProfiles < ActiveRecord::Migration
  def up
    remove_column :profiles, :stars_count
  end

  def down
    add_column :profiles, :stars_count, :integer, :default => 0
    
    Profile.reset_column_information
    Profile.all.each do |p|
      Profile.update_counters p.id, :stars_count => p.stars.length
    end 
  end
end
