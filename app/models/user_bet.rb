class UserBet < ApplicationRecord
  belongs_to :user
  belongs_to :bet

  validates_uniqueness_of :user_id, scope: :bet_id
  after_create :sub

  def sub
    bet = Bet.find(self.bet_id)
    balance = user.wallet.balance
    user.wallet.update(balance:(balance - bet.amount))
  end
end
