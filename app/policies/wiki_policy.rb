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

  def show?
    record.public? || user.present?
  end

  def edit?
    create?
  end

  def destroy?
    create?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      return scope.publicly_viewable unless user
      # { premium ? publicly_viewable && privately_viewable : publicly_viewable }
      if user.admin?
        scope.all
      elsif user.premium?
        scope.where("private = ? OR user_id = ?", false, user.id)
      elsif user
        scope.publicly_viewable
      else
        scope.none
      end
    end
  end


end
