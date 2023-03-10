class UserBetsController < ApplicationController
  def create
    if Bet.find(params[:bet_id]).result.nil?
      @user_bet = UserBet.new(user_id: current_user.id, bet_id: params[:bet_id], answer: params[:answer])
      @user_bet.user = current_user
      authorize @user_bet
      if @user_bet.save
        redirect_to user_bet_path(@user_bet), notice: "Bet was successfully created"
      else
        render :json, status: :unprocessable_entity
      end
    else
      render notice: "Bet finished!"
    end
  end
end
