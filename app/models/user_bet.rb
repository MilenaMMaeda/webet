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

  # aposta criada
  # status "open"
  # aposta editada e salva
  # após editada o status da aposta muda para finished
  # após alterado, pega o valor total das bets e dividir pelo n de vencedores
  # os vencedores são os users com respostas iguais a resposta da bet
  # somar na carteira os valores


end
