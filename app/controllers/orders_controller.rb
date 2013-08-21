class OrdersController < ApplicationController
  before_action :authenticate!
  before_filter :find_order_by_id, only: [:show, :update, :destroy]
  before_filter :find_establishment, only: [:show, :create]

  respond_to :js, only: :update

  def show
    return redirect_to establishments_path, alert: t('.establishment_not_found') unless @establishment

    @dishes = @establishment.dishes
  end

  def create
    return redirect_to establishments_path, alert: t('.invalid_establishment') unless @establishment

    @order = Order.new
    @order.establishment = @establishment
    @order.user = current_user

    if @order.save
      return redirect_to establishment_order_path(id: @order), notice: t('.order_created')
    end

    redirect_to establishment_order_path(id: @order), alert: t('.errors_creating_order')
  end

  def update
    @order.user_id_payment = current_user.id if params[:order][:payment]

    @order.update_attributes params_order

    respond_with @order
  end

  def destroy
    deleted = @order.destroy if @order

    redirect_to establishments_path, t('.order_deleted') if deleted
  end

  private

  def params_order
    params.require(:order).permit(:status, :payment)
  end

  def find_establishment
    @establishment= Establishment.find_by_id params[:establishment_id]
    return redirect_to establishment_path(@establishment), alert: t('.invalid_establishment') unless @establishment
  end
end
