class LoansController < ApplicationController
  before_action :set_loan, only: [:accept, :return, :destroy]
  respond_to :html, :js
  def create_from
    @loan = Loan.new(loan_params)
    @loan.creditor_id = current_user.id
    @loan.returned = false
    @loan.accepted = true
    respond_to do |format|
      if @loan.save
        format.js
      else
        format.js
      end
    end
  end

  def create_whom
    @loan = Loan.new(loan_params)
    @loan.debtor_id = current_user.id
    @loan.returned = false
    @loan.accepted = false
    respond_to do |format|
      if @loan.save
        format.js
      else
        format.html { render 'my_wallet/index' }
        @expense = Expense.new
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  def accept
    if @loan.accepted
      @loan.update_attribute(:accepted, false)
    else
      @loan.update_attribute(:accepted, true)
    end
  end

  def return
    if @loan.returned
      @loan.update_attribute(:returned, false)
    else
      @loan.update_attribute(:returned, true)
    end
  end

  def destroy
    @id = @loan.id
    @loan.destroy
    respond_to do |format|
      format.js
    end
  end

  private
  def set_loan
    @loan = Loan.find(params[:id])
  end

  def loan_params
    params.require(:loan).permit(:creditor_id, :debtor_id, :loan_date, :expire_date, :accepted, :sum, :returned)
  end
end
