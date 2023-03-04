class UserBet < ApplicationRecord
  belongs_to :user
  belongs_to :bet

  validates_uniqueness_of :user_id, scope: :bet_id
end
