class BetsController < ApplicationController
  def index
    @bets = Bet.all
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
