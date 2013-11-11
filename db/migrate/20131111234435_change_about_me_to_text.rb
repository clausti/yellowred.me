class ChangeAboutMeToText < ActiveRecord::Migration
  def up
    change_column :profiles, :about_me, :text
  end

  def down
    change_column :profiles, :about_me, :string
  end
end
