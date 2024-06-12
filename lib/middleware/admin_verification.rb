class AdminVerification
  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new(env)
    if request.path.start_with?('/admin')
      user = User.find_by(email: request.session[:user_login])
      unless user&.is_admin
        return [302, { 'Location' => '/', 'Content-Type' => 'text/html' }, ['Accès refusé']]
      end
    end
    @app.call(env)
  end
end