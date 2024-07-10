class BudgetsController < ApplicationController
  before_action :set_budget, only: %i[show update destroy edit assign spend]

  def create
    budget = Budget.create(budget_params)

    redirect_to budget_path(budget)
  end

  def update
    sum = budget_params[:sum].to_i

    if params[:commit] == 'assign'
      @budget.update(allocated_sum: @budget.allocated_sum + sum)
    elsif params[:commit] == 'spend'
      account = Account.find_by(id: budget_params[:account_id])
      account.update(balance: account.balance - sum)
      @budget.update(allocated_sum: @budget.allocated_sum - sum)
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

  def spend
    @account_options = Account.all.map { |account| [account.name, account.id]}
    @default_account_id = Account.find_by(name: :tnkf).id
  end

  def assign; end

  private

  def budget_params
    params.require(:budget).permit(
      :name,
      :account_id,
      :sum
    )
  end

  def set_budget
    @budget = Budget.find(params[:id])
  end
end
