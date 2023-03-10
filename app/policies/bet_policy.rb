class BetPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!

    def resolve
      scope.all
      # @user = user
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    record.user == user
  end

  def edit?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def vote?
    !user.user_bets.exists?(bet_id: record.id)
  end

end
