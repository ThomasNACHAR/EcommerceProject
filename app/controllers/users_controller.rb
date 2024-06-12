class UsersController < ApplicationController
  def login
    if request.post?
      @user = User.new
      if user_params[:email].blank? || user_params[:password].blank?
        return
      end
      @user = User.find_by(email: user_params[:email])
      if @user
        if @user.authenticate(user_params[:password])
          session[:user_login] = @user.email
          redirect_to params[:original_url] || root_path
        else
          add_notification("Mot de passe invalide", "error")
        end
      else
        add_notification("L'utilisateur n'existe pas", "error")
      end
    else
      @user = User.new
    end
  end

  def register
    if request.post?
      @user = User.new(user_params)
      if @user.save
        redirect_to root_path, notice: "Inscription réussie !"
      else
        puts @user.errors.full_messages
        add_notification("Erreur d'inscription", "error")
        render :register
      end
    else
      @user = User.new
    end
  end

  def logout
    if current_user
      session.delete(:user_login)
      redirect_to root_path, notice: "Déconnexion réussie !"
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :telephone, :password, :password_confirmation)
  end
end