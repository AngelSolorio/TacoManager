class HomeController < ApplicationController
  before_action :authenticate!

  def index
    @user = User.first
  end
end
