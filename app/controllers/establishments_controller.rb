class EstablishmentsController < ApplicationController
  before_action :authenticate!
  before_filter :find_establishment_by_id, only: :show
  before_filter :my_establishment?, only: [:edit, :update, :destroy]

  def index
    @establishments = Establishment.all
  end

  def new
    @establishment = Establishment.new
    @establishment.build_images
  end

  def edit
  end

  def show
    return redirect_to establishments_path, alert: t('.establishment_not_found') unless @establishment

    @order = @establishment.orders.build
    @dishes = Dish.where(establishment_id: params[:id])
    @comment = @stablishment.comments.build
  end

  def create
    @establishment = Establishment.new establishment_params
    @establishment.user = current_user

    if @establishment.save
      return redirect_to establishments_path, notice: t('.establishment_created')
    end

    flash.now[:alert] = t('.error_creating_establishment')
    render :new
  end

  def update
    if @establishment
      @establishment.address.update params_address
      updated = @establishment.update establishment_params
    end

    return redirect_to establishment_path(id: @establishment.id), t('.establishment_updated') if updated

    flash.now[:alert] = t('.error_updating_establishment')
    render :edit
  end

  def destroy
    return redirect_to establishments_path, alert: t('.destroy_not_allowed') unless current_user.admin

    if @establishment.destroy
    redirect_to  establishments_path(@establishment), deleted, t('.establishment_deleted')
    end
  end

  private
  def my_establishment
    @establishment = Establishment.find_by_id_and_user_id params[:id], current_user.id

    return redirect_to establishments_path, alert: t('.not_access') unless @establishment
  end

  def find_establishment_by_id
    @establishment = Establishment.find_by_id params[:id]
  end

  def establishment_params
    params.require(:establishment).permit(:user_id, :name, :address, :latitude, :longitude, :schedule, :points)
  end
end
