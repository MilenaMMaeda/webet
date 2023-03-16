class Wallet < ApplicationRecord
  belongs_to :user
  attribute :balance, :integer, default: 0
  # validates :withdraw_amount, numericality: { greater_than_or_equal_to: 0 }
  # validate :withdraw_amount_less_than_or_equal_to_balance

  # def withdraw_amount_less_than_or_equal_to_balance
  #   if withdraw_amount && withdraw_amount > balance
  #     errors.add(:withdraw_amount, "cannot be greater than the current balance")
  #   end
  # end
end
