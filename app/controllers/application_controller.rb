class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :user_logged?, :warden

  protected
  def warden
    request.env['warden']
  end

  def user_logged?
    warden.authenticate?(scope: :user)
  end

  def current_user
    warden.user(:user)
  end

  def authenticate!
    redirect_to root_path, alert: t('.not_logged') unless user_logged?
  end
end
