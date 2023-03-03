class WalletPolicy < ApplicationPolicy
  def show?
    user == record.user
  end
end
