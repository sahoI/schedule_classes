class AddColumnWednesday < ActiveRecord::Migration[5.2]
  def change
    add_column :wednesdays, :first, :integer
    add_column :wednesdays, :second, :integer
    add_column :wednesdays, :third, :integer
    add_column :wednesdays, :fourth, :integer
    add_column :wednesdays, :fifth, :integer
  end
end
