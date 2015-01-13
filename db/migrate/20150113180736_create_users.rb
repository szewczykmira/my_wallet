class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false, default: "User"

      t.timestamps null: false
    end
  end
end
