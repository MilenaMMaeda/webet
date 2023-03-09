class WalletsController < ApplicationController
  def show
    @wallet = current_user.wallet
    authorize @wallet
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
