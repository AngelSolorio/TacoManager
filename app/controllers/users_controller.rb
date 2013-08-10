class UsersController < ApplicationController
  def new
    @user = env['omniauth.identity'] ||= User.new
  end
end