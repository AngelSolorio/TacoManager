class UsersController < ApplicationController
  before_action :authenticate!, only: :update

  def new
    @user = env['omniauth.identity'] ||= User.new
  end

  def show
    @user = User.find_by_id current_user.id
  end

  def update
    @user = User.find_by_id params[:id]
    updated = @user.update user_params

    return redirect_to user_path(@user), notice: t('.user_updated') if updated

    flash.now[:alert] = t('.errors_updating')
    render html: @user, location: root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :picture)
  end
end