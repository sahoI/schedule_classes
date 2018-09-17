class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.integer :mon
      t.integer :tues
      t.integer :wednes
      t.integer :thurs
      t.integer :fri
      t.integer :satur
      t.timestamps
    end
  end
end
