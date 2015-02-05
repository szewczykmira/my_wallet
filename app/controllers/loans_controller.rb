class LoansController < ApplicationController
  before_action :set_loan, only: [:accept, :return, :destroy]
  def create
    @loan = Loan.new(loan_params)
    respond_to do |format|
      if @loan.save
        format.html { redirect_to root_path }
        format.json { render 'my_wallet/index', status: :created }
      else
        format.html { render 'my_wallet/index' }
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
    redirect_to root_path
  end

  def return
    if @loan.returned
      @loan.update_attribute(:returned, false)
    else
      @loan.update_attribute(:returned, true)
    end
    redirect_to root_path
  end

  def destroy
    @loan.destroy
    redirect_to root_path
  end

  private
  def set_loan
    @loan = Loan.find(params[:id])
  end

  def loan_params
    params.require(:loan).permit(:creditor_id, :debtor_id, :loan_date, :expire_date, :accepted, :sum, :returned)
  end
end
