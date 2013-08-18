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

  def destroy
    @account = current_user.accounts.find(params[:id])

    if @account.destroy
      flash[:notice] = 'Conta apagada com sucesso.'
    else
      flash[:error] = 'Não foi possível apagar a conta.'
    end
    redirect_to accounts_url
  end

  private
    def create_params
      params.require(:account).permit(:initial_balance, :description)
    end
end
