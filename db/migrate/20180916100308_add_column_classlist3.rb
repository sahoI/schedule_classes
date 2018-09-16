class AddColumnClasslist3 < ActiveRecord::Migration[5.2]
  def change
    add_column :classlists, :season, :string
    add_column :classlists, :grade, :string
    add_column :classlists, :evaluation, :string
  end
end
