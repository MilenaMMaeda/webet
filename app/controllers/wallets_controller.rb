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

# def show
#   if current_user.signed_in?
#   @wallet = current_user.wallet
#   else
#     redirect_to new_user_session_path
#   end
#   authorize @wallet
# end
