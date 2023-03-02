class BetsController < ApplicationController
  def index
    @bets = Bet.all
  end

  def show
    @bet = Bet.find(params[:id])
    authorize @bet
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
    @bet.user = current_user
    authorize @bet
      if @bet.save
        redirect_to bet_path(@bet), notice: "Bet was successfully created"
      else
        render :new, status: :unprocessable_entity
      end
  end

  def edit
    @bet = Bet.find(params[:id])
    authorize @bet
  end

  def update
    @bet = Bet.find(params[:id])
    @bet.update(bet_params)
    redirect_to Bet.find(params[:id]), notice: "Bet was successfully updated"
    authorize @bet
  end

  private


  def bet_params
    params.require(:bet).permit(:user, :description, :amount, :start_date, :end_date, :status, :max_users)
  end

end
