class MyWalletController < ApplicationController
  before_action :authenticate_user!
  def index
    @loan = Loan.new
    @expense = Expense.new
  end
end
