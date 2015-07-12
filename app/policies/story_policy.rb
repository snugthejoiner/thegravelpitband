class StoryPolicy < ApplicationPolicy
 
  def show?
    true
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    user.present? && (record.user == user || user.modplus?)
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end

end
