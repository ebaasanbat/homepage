class AddUserIdToToolsNote < ActiveRecord::Migration[5.0]
  def change
    add_column :tools_notes, :user_id, :integer
  end
end
