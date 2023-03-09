class WalletsController < ApplicationController
  def show
    @wallet = current_user.wallet
    authorize @wallet
  end

  # def update_balance
  #   @wallet = Wallet.find_by(user_id: params[:user_id])
  #   authorize @wallet
  #   amount = params[:amount].to_i
  #   @wallet.balance += amount
  #   if @wallet.save
  #     flash[:notice] = "Balance updated successfully."
  #   else
  #     flash[:error] = "Failed to update balance."
  #   end
  #   redirect_to user_wallet_path(current_user)
  # end

  # def update_balance(amount)
  #   @wallet = Wallet.find_by(user: current_user)
  #   authorize @wallet
  #   balance = @wallet.balance
  #   @wallet.update(balance: (balance + amount))
  # end

end

# def show
#   if current_user.signed_in?
#   @wallet = current_user.wallet
#   else
#     redirect_to new_user_session_path
#   end
#   authorize @wallet
# end
