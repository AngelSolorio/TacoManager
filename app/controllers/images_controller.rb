class ImagesController < ApplicationController
  def create
    @image = Image.new
    @image.establishment = params[:establishment]
    @image.image = params[:establishment][:image]
    @image.save

    redirect_to establishment_path(params[:establishment])
  end

  private
  def params_establishment
    params.require(:establishment).permit(:id, :image)
  end
end