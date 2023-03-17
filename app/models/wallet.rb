class Wallet < ApplicationRecord
  belongs_to :user
  attribute :balance, :integer, default: 0
end
