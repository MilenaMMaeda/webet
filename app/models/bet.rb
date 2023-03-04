class Bet < ApplicationRecord
  belongs_to :user
  has_many :user_bets
  has_many :users, through: :user_bets
  has_one_attached :photo
end
