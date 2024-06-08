class ApplicationController < ActionController::Base
  require 'securerandom' #Pour générer des id uniques

  helper_method :current_user

  def delete_notification
    id = params[:id]
    render turbo_stream: turbo_stream.remove(id)
  end

  private

  def current_user
    return nil unless session[:user_login]

    User.all.each do |user|
      return user if BCrypt::Password.new(session[:user_login]) == user.email
    end
  end
end
