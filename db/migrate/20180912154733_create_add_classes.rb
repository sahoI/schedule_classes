class CreateAddClasses < ActiveRecord::Migration[5.2]
  def change
    create_table :add_classes do |t|

      t.timestamps
    end
  end
end
