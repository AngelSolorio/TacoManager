class ProfileController < ApplicationController
  before_action :authenticate!

  def show
    @user = User.find_by_id current_user.id
  end
end
