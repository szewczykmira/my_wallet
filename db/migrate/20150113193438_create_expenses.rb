class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.integer :user_id, null: false
      t.text :for_what, null: false
      t.decimal :how_much, null: false
      t.boolean :needed, null: true, default: false

      t.timestamps null: false
    end
  end
end
