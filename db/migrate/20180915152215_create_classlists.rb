class CreateClasslists < ActiveRecord::Migration[5.2]
  def change
    create_table :classlists do |t|

      t.timestamps
    end
  end
end
