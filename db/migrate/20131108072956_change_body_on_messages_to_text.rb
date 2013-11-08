class ChangeBodyOnMessagesToText < ActiveRecord::Migration
  def up
    change_column :messages, :body, :text #pg won't take limit on text type
  end

  def down
    change_column :messages, :body, :string
  end
end

