class AddColumnClasslist < ActiveRecord::Migration[5.2]
  def change
    add_column :classlists, :name, :string
    add_column :classlists, :teacher, :string
    add_column :classlists, :department, :string
    add_column :classlists, :day, :string
    add_column :classlists, :class, :integer
    add_column :classlists, :text, :string
  end
end
