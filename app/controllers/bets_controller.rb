class BetsController < ApplicationController
  def index
    @bets = policy_scope(Bet)
  end

  def show
    @bet = Bet.find(params[:id])
    authorize @bet
  end

  def edit
    @bet = Bet.find(params[:id])
    authorize @bet
  end
end
