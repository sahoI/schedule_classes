class AddCulumnUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :email, :string
    add_column :users, :department, :string
    add_column :users, :friend_id, :string
  end
end
