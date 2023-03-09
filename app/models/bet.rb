class Bet < ApplicationRecord
  belongs_to :user
  has_many :user_bets
  has_many :users, through: :user_bets
  has_one_attached :photo
  after_update :bet_result

  def winners
    winners = self.user_bets.where(answer: self.result)
    prize = self.amount * self.user_bets.count
    winners.each do |winner|
      winner.user.wallet.balance += (prize / winners.count)
    end
    self.update_column(:status, "finished")
  end

  def bet_result
    winners
  end
end
