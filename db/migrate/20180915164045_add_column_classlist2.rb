class AddColumnClasslist2 < ActiveRecord::Migration[5.2]
  def change
    add_column :classlists, :number, :string
  end
end
