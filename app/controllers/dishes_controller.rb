class DishesController < ApplicationController
  before_filter :find_dish_by_id_and_establishment_id, except: [:index, :create, :destroy]

  def index
   @dishes = Dish.find_by_establishment_id params[:establishment_id]
  end

  def show
    return redirect_to establishment_dishes_path, alert: t('.not_found') unless @dish
  end

  def new
    @dish = Dish.new
    @dish.build_image
  end

  def create
    @establishment = Establishment.find_by_id params[:establishment_id]

    return redirect_to establishment_dishes_path, alert: t('.not_found') unless @establishment

    @dish = Dish.new dish_params.except(:image)
    @dish.image = Image.new image: params[:food][:image]
    @dish.establishment = @establishment

    return redirect_to dashboard_establishment_path(id: @establishment.id), notice: t('.created') if @food.save

    flash.now[:alert] = t('.error')
    render :new
  end

  def edit
    return redirect_to dashboard_establishment_foods_path, alert: t('.not_found') unless @food
  end

  def update
    @dish.image.update_attribute(:image, params[:dish][:image]) if params[:dish][:image]

    if @dish.update_attributes dish_params.except(:image)
      return redirect_to establishment_path(id: params[:establishment_id]), notice: t('.updated')
    end

    flash.now[:alert] = @dish.errors.message
    render :edit
  end

  def destroy
    @dish.destroy

    redirect_to establishment_dishes_path, notice: t('.dish_deleted')
  end

  private
  def find_dish_by_id_and_establishment_id
    @dish = Dish.find_by_id_and_establishment_id params[:id], params[:establishment_id]
  end

  def dish_params
    params.require(:dish).permit :name, :price, :description, :image
  end
end