class WalletPolicy < ApplicationPolicy
  def show?
    user == record.user
  end

  def update_balance?
    user == record
  end

  def update?
    user == record.user
  end
end
