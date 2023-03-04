class WalletsController < ApplicationController
  def show
    @wallet = current_user.wallet
    authorize @wallet
  end
end
