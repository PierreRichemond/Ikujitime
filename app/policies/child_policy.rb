class ChildPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def update?
    true
  end

  def show?
    true
  end

  def index?
    true
  end

  def destroy?
    true
  end
end
