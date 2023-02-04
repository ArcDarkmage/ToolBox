class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.find(user.id)
    end
  end

  def show?
    record == user
  end
end
