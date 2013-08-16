class RatesController < ApplicationController
  before_action :authenticate!

  def create
    @establishment = Establishment.find_by_id params[:establishment_id]
    user = User.find_by_id params[:user_id]

    rate = Rate.new
    rate.establishment = @establishment
    rate.user = user
    rate.points = params[:points]

    if rate.save
      redirect_to establishment_path(@establishment), notice: t('.rate_created')
    end

    flash.now[:alert] = t('.rating_error')
  end
end