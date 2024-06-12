class ApplicationController < ActionController::Base
  require 'securerandom' #Pour générer des id uniques

  helper_method :current_user, :add_notification, :delete_notification

  def add_notification(message, type)
    if message.is_a?(Array)
      message.each do |msg|
        id = SecureRandom.uuid
        notification = render_to_string(partial: "layouts/notification", locals: { id: id, message: msg, type: type })
        render turbo_stream: turbo_stream.append("notifications", html: notification)
      end
    else
      id = SecureRandom.uuid
      notification = render_to_string(partial: "layouts/notification", locals: { id: id, message: message, type: type })
      render turbo_stream: turbo_stream.append("notifications", html: notification)
    end
  end

  def delete_notification
    @id = params[:id]
    render turbo_stream: turbo_stream.remove(@id)
  end

  private

  def current_user
    return nil unless session[:user_login]

    user = User.find_by(email: session[:user_login])
  end
end
