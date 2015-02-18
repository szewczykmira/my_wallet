require 'test_helper'

class ExpenseControllerTest < ActionController::TestCase
  test 'should create expense' do
    assert_difference('Expense.count') do
      post :create, expense: { user_id: 1, for_what: 'Nothing', how_much: 23.34, needed: false}
    end
  end

  test 'should not create expense' do
    assert_no_difference('Expense.count') do
      post :create, expense: {user_id:4, for_what: 'Smth' }
    end
  end

  test 'should destroy expense' do
    assert_diffrence('Expense.count', -1) do
      delete :destroy, id: @expense
    end
  end
end
