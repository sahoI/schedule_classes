class CreateWednesdays < ActiveRecord::Migration[5.2]
  def change
    create_table :wednesdays do |t|
      t.integer "first"
      t.integer "second"
      t.integer "third"
      t.integer "fourth"
      t.integer "fifth"
      t.timestamps
    end
  end
end
