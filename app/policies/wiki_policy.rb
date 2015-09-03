class WikiPolicy < ApplicationPolicy

  def index?
    true
  end

  def create?
    user.present? || user.admin?
  end

  def update?
    create?
  end

  def edit?
    create?
  end

  def destroy?
    create?
  end


end
