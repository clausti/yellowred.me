class ChangeBodyOnMessagesToText < ActiveRecord::Migration
  def up
    change_column :messages, :body, :text, :limit => 1200
  end

  def down
    change_column :messages, :body, :string
  end
end
