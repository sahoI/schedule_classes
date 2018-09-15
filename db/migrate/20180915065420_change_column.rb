class ChangeColumn < ActiveRecord::Migration[5.2]
  def up
    remove_column :users, :grade, :string
  end

  def down
    add_column :users, :grade, :integer
  end
end
