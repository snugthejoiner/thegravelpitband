class RegistrationsController < Devise::RegistrationsController

  # def edit
    # @user = current_user
  # end

  private

  def sign_up_params
    params.require(:user).permit(:name, :birthdate, :email, :subscription, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :birthdate, :email, :subscription, :password, :password_confirmation, :current_password)
  end

end
