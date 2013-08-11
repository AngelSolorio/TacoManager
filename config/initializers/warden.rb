Rails.application.config.middleware.use Warden::Manager do |manager|
  manager.default_strategies :omniauth_public
  manager.failure_app = lambda { |env| SessionsController.action(:failure).call(env) }
end

Warden::Manager.serialize_into_session(:user) do |user|
  user.id
end

Warden::Manager.serialize_from_session(:user) do |id|
  User.find(id)
end

Warden::Strategies.add(:omniauth_public) do
  def valid?
    controller_name = request.env['action_dispatch.request.parameters']['controller']
    controller_name == 'sessions'
  end

  def authenticate!
    auth = request.env['omniauth.auth']

    Rails.logger.debug "----- #{auth.inspect} -----"
    user = User.from_omniauth(auth)
    return fail! I18n.t('warden.strategies.unauthorized_user') unless user.active
    success! user
  end
end
