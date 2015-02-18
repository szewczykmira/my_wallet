require 'test_helper'

class LoanTest < ActiveSupport::TestCase
  test 'loan requires sum' do
    loan = Loan.new(creditor_id: 2, debtor_id: 5)
    assert_not loan.valid?, 'Sum is required'
  end

  test 'loan requires debtor_id' do
    loan = Loan.new(creditor_id: 3, sum: 45.00)
    assert_not loan.valid?, 'Debtor_id is required'
  end
  
  test 'loan requires creditor_id' do
    loan = Loan.new(debtor_id: 8, sum: 45.00)
    assert_not loan.valid?, 'Creditor_id is required'
  end 
end
