class OrderPolicy < ApplicationPolicy
  # class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  # end

  def show?
    # Allow the order owner to view the order
    user == record.user
  end

  def create?
    # Allow any logged-in user to create an order
    user.present?
  end

  def update?
    # Allow the order owner to update the order
    user == record.user
  end

end
