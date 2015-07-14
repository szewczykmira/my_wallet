class ExpenseController < ApplicationController
  def create
    @expense = Expense.new(expense_params)
    @expense.user_id = current_user.id
    respond_to do |format|
      if @expense.save
        format.js 
      else
        format.js
      end
    end
  end
  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
  end
  private
  def expense_params
    params.require(:expense).permit(:user_id, :for_what, :how_much, :needed, :expense_date)
  end
end
