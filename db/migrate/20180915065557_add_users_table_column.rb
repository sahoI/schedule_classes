class AddUsersTableColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :grade, :integer
  end
end
