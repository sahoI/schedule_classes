class CreateAddRegisterColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :add_register_columns do |t|
      t.string
      t.timestamps
    end
  end
end
