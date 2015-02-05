class ExpenseController < ApplicationController
  def create
    @expense = Expense.new(expense_params)
    respond_to do |format|
      if @expense.save
        format.html { redirect_to root_path }
        format.json { render 'my_wallet/index', status: :created }
      else
        format.html { render 'my_wallet/index' }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
    redirect_to root_path
  end
  private
  def expense_params
    params.require(:expense).permit(:user_id, :for_what, :how_much, :needed, :expense_date)
  end
end
