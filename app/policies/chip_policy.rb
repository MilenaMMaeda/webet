class ChipPolicy < ApplicationPolicy
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

end
