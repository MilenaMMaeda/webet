class WalletPolicy < ApplicationPolicy
  def show?
    user == record.user
  end

  def update_balance?
    user == record
  end

end
