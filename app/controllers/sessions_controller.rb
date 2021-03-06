class SessionsController < ApplicationController
  def new
  end

  def create
    warden.authenticate!(scope: :user)
    redirect_to root_url, notice: t('.signed_in')
  end

  def destroy
    warden.logout(:user)
    redirect_to signin_path, notice: t('.signed_out')
  end

  def failure
    redirect_to signin_path, alert: "Authentication failed, please try again."
  end
end
