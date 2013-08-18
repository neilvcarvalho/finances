class AccountsController < ApplicationController
  def index
    @accounts = current_user.accounts
  end

  def new
    @account = current_user.accounts.new
  end

  def create
    @account = current_user.accounts.new(create_params)

    if @account.save
      redirect_to accounts_url, notice: 'Conta criada com sucesso.'
    else
      render action: :new
    end
  end

  private
    def create_params
      params.require(:account).permit(:initial_balance, :description)
    end
end
