class CreateDayData < ActiveRecord::Migration[5.2]
  def change
    create_table :day_data do |t|
      t.integer :day_of_the_week
      t.integer :time_schedule

      t.timestamps
    end
  end
end
