class RemoveThursdayTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :thursdays
  end
end
