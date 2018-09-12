class CreateReregistrates < ActiveRecord::Migration[5.2]
  def change
    create_table :reregistrates do |t|
      t.string name
      t.timestamps
    end
  end
end
