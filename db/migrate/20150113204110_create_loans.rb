class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.integer :creditor, null:false
      t.integer :debtor, null:false
      t.date :loan_date
      t.date :expire_date
      t.decimal :sum
      t.boolean :accepted, default: false
      t.boolean :returned, default: false

      t.timestamps null: false
    end
  end
end
