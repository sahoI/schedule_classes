class CreateThursdays < ActiveRecord::Migration[5.2]
  def change
    create_table :thursdays do |t|
      t.integer "first"
      t.integer "second"
      t.integer "third"
      t.integer "fourth"
      t.integer "fifth"
      t.timestamps
    end
  end
end
