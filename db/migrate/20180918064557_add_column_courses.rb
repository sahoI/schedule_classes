class AddColumnCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :day_of_the_week, :string
    add_column :courses, :time_schedule, :integer
  end
end
