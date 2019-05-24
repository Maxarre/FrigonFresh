class FridgePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def update?
    if @user[:category] == "owner"
      record.user == user
    end
  end

  def destroy?
    if @user[:category] == "owner"
      record.user == user
    end
  end
end
