class CreateThesdays < ActiveRecord::Migration[5.2]
  def change
    create_table :thesdays do |t|
      t.integer "first"
      t.integer "second"
      t.integer "third"
      t.integer "fourth"
      t.integer "fifth"
      t.timestamps
    end
  end
end
