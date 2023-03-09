class WalletsController < ApplicationController
  def show
    @wallet = current_user.wallet
    authorize @wallet
  end

  def update_balance
    amount = params[:amount].to_i
    @wallet = current_user.wallet
    authorize @wallet, :update_balance?
    @wallet.balance += amount
    @wallet.save!

    redirect_to user_wallet_path(user_id: current_user.id)
  end

end
