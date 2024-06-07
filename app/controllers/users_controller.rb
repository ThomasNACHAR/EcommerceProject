class UsersController < ApplicationController
  def login
  end

  def register
    if request.post?
      @user = User.new(register_params)
      if @user.save
        redirect_to root_path, notice: "Inscription réussie !"
      else
        puts @user.errors.full_messages
        flash.now[:alert] = "Erreur d'inscription"
        render :register
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :telephone, :password, :password_confirmation)
  end
  def register_params
    params.permit(:first_name, :last_name, :email, :telephone, :password, :password_confirmation)
  end
end