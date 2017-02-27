class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user_id: user.id)
      end
    end
  end

  def index?
    true
  end

  def show?
    record.user_id == user.id || user.admin?
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    record.user_id == user.id || user.admin?
  end

  def edit?
    update?
  end

  def destroy?
    record.user_id == user.id || user.admin?
  end

  def description?
    user.admin?
  end

  def permitted_attributes
    if user.admin?
      [:title, :description]
    else
      [:title]
    end
  end
end