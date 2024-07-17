class AccountsController < ApplicationController
  before_action :set_account, only: %i[show edit update destroy]
  def create
    account = Account.create(account_params)
    redirect_to account_path(account)
  end

  def update
    @account.update(account_params)

    redirect_to account_path(@account)
  end

  def destroy
    @account.destroy
    redirect_to accounts_path
  end

  def show
  end

  def index
    @accounts = Account.all
  end

  def new
    @account = Account.new
  end

  def edit
  end

  private

  def account_params
    params.require(:account).permit(:name, :balance)
  end

  def set_account
    @account = Account.find(params[:id])
  end
end
