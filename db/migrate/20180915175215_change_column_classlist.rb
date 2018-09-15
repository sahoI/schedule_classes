class ChangeColumnClasslist < ActiveRecord::Migration[5.2]
  def change
    remove_column :classlists, :text, :string
    remove_column :classlists, :day, :string
    remove_column :classlists, :class, :integer
    add_column :classlists, :textbook, :string
    add_column :classlists, :day_of_the_week, :string
    add_column :classlists, :time_schedule, :integer
  end
end
