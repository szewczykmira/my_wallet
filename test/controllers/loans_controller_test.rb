require 'test_helper'

class LoansControllerTest < ActionController::TestCase
  test 'should create new' do
    assert_diffrence('Loans.count') do
      post :create, loan: { creditor_id: 1, debtor_id: 2, sum: 23.34 }
    end
  end

  test 'should not create new' do
    assert_no_difference('Loans.count') do
      post :create, loan: {}
    end
  end

end
