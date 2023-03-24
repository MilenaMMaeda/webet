class BetsController < ApplicationController
  before_action :authenticate_user!


  def index
    @bets = policy_scope(Bet)
  end

  def show
    @bet = Bet.find(params[:id])
    authorize @bet
    # raise
  end

  def new
    if current_user.blank?
      redirect_to new_user_session_path
    end
    @bet = Bet.new
    authorize @bet
  end

  def create
    @bet = Bet.new(bet_params)
    puts bet_params
    @bet.user = current_user
    authorize @bet
      if @bet.save
        redirect_to bets_path(@bet), notice: "Bet was successfully created"
      else
        render :new, status: :unprocessable_entity
      end
  end

  def edit
    @bet = Bet.find(params[:id])
    authorize @bet

    # if @bet.updated_once?
    #   redirect_to bets_path, alert: "Already updated once, contact support"
    # else
    #   render :edit
    # end
  end

  def update
    @bet = Bet.find(params[:id])
    authorize @bet

    if @bet.update(bet_params)
      redirect_to @bet, notice: "Bet was successfully updated"
      # elsif @bet.update(bet_params.merge(updated_once: true))
      # redirect_to bets_path, alert: "Already updated once, contact support"
      # Comentamos para a apresentação.
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    @bet = Bet.find(params[:id])
    @bet.destroy
    redirect_to bets_path
    authorize @bet
  end

  private


  def bet_params
    params.require(:bet).permit(:user, :description, :amount, :start_date, :end_date, :status, :max_users, :photo, :result, :updated_once)
  end

end
