class CreateRegisters < ActiveRecord::Migration[5.2]
  def change
    create_table :registers do |t|
      t.string :name
      t.integer :class_id
      t.timestamps
    end
  end
end
