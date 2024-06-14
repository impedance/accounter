class BudgetsController < ApplicationController
  before_action :set_budget, only: %i[show update destroy edit]

  def create
    budget = Budget.create(budget_params)

    redirect_to budget_path(budget)
  end

  def update
    if budget_params.include?(:sum_to_allocate)
      sum = budget_params[:sum_to_allocate].to_i
      @budget.update(allocated_sum: @budget.allocated_sum + sum)
    elsif budget_params.include?(:sum_to_spend)
      sum = budget_params[:sum_to_spend].to_i
      @budget.update(allocated_sum: @budget.allocated_sum - sum)
    else
      @budget.update(budget_params)
    end
    redirect_to budget_path(@budget)
  end

  def destroy
    @budget.destroy
    redirect_to budgets_path
  end

  def show
  end

  def index
    @budgets = Budget.all
  end

  def new
    @budget = Budget.new
  end

  def edit
  end

  private

  def budget_params
    params.require(:budget).permit(:name, :sum_to_allocate, :sum_to_spend)
  end

  def set_budget
    @budget = Budget.find(params[:id])
  end
end
