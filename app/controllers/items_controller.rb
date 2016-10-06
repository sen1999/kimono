class ItemsController < ApplicationController

  def index
    @kimonos = Kimono.all
  end

  def show
    @kimono = Kimono.find(params[:id])
  end

  def new
    @kimonos = Kimono.all
    @kimono = Kimono.new
  end

  def create
    Kimono.create(create_params)
    @kimonos = Kimono.all
  end

  def destroy
    Kimono.find(params[:id]).destroy
    @kimonos = Kimono.all
  end

  def edit
    @kimono = Kimono.find(params[:id])
  end

  def update
    # @kimono = Kimono.find(params[:id]).update(update_params)
    Kimono.update(update_params)
  end
private
  def create_params
    params.require(:kimono).permit(:image, :use_list)
  end

  def update_params
    params.require(:kimono).permit(:image, :use_list)
  end
end
