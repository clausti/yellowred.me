class RemoveNotNullFromProfilesGenderAndAboutMe < ActiveRecord::Migration
  def up
    change_column :profiles, :gender, :string, :null => true
    change_column :profiles, :about_me, :string, :null => true
  end

  def down
    change_column :profiles, :gender, :string, :null => false
    change_column :profiles, :about_me, :string, :null => false
  end
end
