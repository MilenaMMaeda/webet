class Bet < ApplicationRecord
  belongs_to :user
  has_many :user_bets
  has_many :users, through: :user_bets

  # validate :voting_allowed_only_between_start_and_end_date

  # def vote(option, user)
  #   return if voted?

  #   if option == "true"
  #     user_bets.create(user: user, value: true)
  #   elsif option == "false"
  #     user_bets.create(user: user, value: false)
  #   end
  # end

  def voted?
    UserBet.where(user_id: user.id, bet_id: id).present?
  end

  # def voting_allowed_only_between_start_and_end_date
  #   if start_date && end_date && !((start_date..end_date).cover?(Date.today))
  #     errors.add(:user_bet, "is not allowed outside the start and end dates")
  #   end
  # end
  # def full?
  #   UserBet.where(user_id: user.id, bet_id: self.id).present?
  # end
end
