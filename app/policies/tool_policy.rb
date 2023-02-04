class ToolPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def show?
    true
  end

  def new?
    true
  end

  def edit?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def update?
    edit?
  end

  def create?
    new?
  end
end
