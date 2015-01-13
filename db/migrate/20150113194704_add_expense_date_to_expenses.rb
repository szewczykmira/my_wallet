class AddExpenseDateToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :expense_date, :date
  end
end
