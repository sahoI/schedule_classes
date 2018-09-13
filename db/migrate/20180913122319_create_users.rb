class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :mail
      t.string :department
      t.string :friend_id
      t.timestamps
    end
  end
end
