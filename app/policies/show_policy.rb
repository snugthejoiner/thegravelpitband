class ShowPolicy < ApplicationPolicy

  def create?
    @user.role == 'admin'
  end
  
end