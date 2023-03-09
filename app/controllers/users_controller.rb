class UsersController < ApplicationController
  def update_balance
    @wallet = Wallet.find_by(user_id: params[:user_id])
    authorize @wallet
    balance = @wallet.balance
    amount = params[:amount].to_i
    @wallet.update(balance: (balance + amount))
  end
end
