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
      sum_to_spend = budget_params[:sum_to_spend].to_i
      account = Account.find_by(id: budget_params[:account_id])
      account.update(balance: account.balance - sum_to_spend)
      @budget.update(allocated_sum: @budget.allocated_sum - sum_to_spend)
    else
      @budget.update(budget_params)
    end
    redirect_to budgets_path
  end

  def destroy
    @budget.destroy
    redirect_to budgets_path
  end

  def show
  end

  def index
    @account_options = Account.all.map { |account| [account.name, account.id]}
    @default_account_id = Account.find_by(name: :tnkf).id
    @accounts = Account.all
    @budgets = Budget.all
  end

  def new
    @budget = Budget.new
  end

  def edit
  end

  private

  def budget_params
    params.require(:budget).permit(
      :name,
      :sum_to_allocate,
      :sum_to_spend,
      :account_id
    )
  end

  def set_budget
    @budget = Budget.find(params[:id])
  end
end
