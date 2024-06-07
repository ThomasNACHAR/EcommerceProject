class ApplicationController < ActionController::Base
  helper_method :current_user

  private

  def current_user
    return nil unless session[:user_login]

    User.all.each do |user|
      return user if BCrypt::Password.new(session[:user_login]) == user.email
    end
  end
end
