class DropTitleFromMessages < ActiveRecord::Migration
  def up
    remove_column :messages, :title
  end

  def down
    add_column :messages, :title, :string, :null => false
  end
end
