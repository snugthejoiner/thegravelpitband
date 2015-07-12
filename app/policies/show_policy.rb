class ShowPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    index?
  end

  def create?
    @user.role == 'admin'
  end

  def new?
    create?
  end

  def update?
    create?
  end

  def edit?
    update?
  end

  def destroy?
    create?
  end
  
end