require 'test_helper'

class ExpenseTest < ActiveSupport::TestCase
  test 'Sum is required' do
    expense = Expense.new(user_id: 5, needed: false, for_what: 'Nic', expense_date: Time.now)
    assert_not expense.valid?, 'How_much is required'
  end

  test 'User is required' do
    expense = Expense.new(for_what: 'Nice', how_much: 34.56, expense_date: Time.now)
    assert_not expense.valid?, 'User_id is required'
  end


  test 'Exepense date is required' do
    expense = Expense.new(for_what: 'Nic', how_much: 56.67, user_id:4)
    assert_not expense.valid?, 'Expense_date is required'
  end
end
