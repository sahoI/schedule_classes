class RemoveCoursesTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :courses
  end
end
