class DeleteTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :fris
    drop_table :thurs
    drop_table :tues
    drop_table :mons
    drop_table :wednes
    drop_table :registraters
    drop_table :add_register_columns
  end
end
