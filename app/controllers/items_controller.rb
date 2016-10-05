class ItemsController < ApplicationController

  def index
    @items = Kimono.all
  end

  def show
    @item = Kimono.find(params[:id])
    @items = params[:tag].present? ? Item.tagged_with(params[:tag]) : Item.all
    @items = @items.includes(:tags)
  end

  def new
    @items = Kimono.all
    @item = Kimono.new
  end

  def create
    Kimono.create(create_params)
    @items = Kimono.all
  end

  def destroy
    Kimono.find(params[:id]).destroy
    @items = Kimono.all
  end

  def edit
    @item = Kimono.find(params[:id])
  end

  def update
    @item = Kimono.find(params[:id]).update(update_params)
  end
private
  def create_params
    params.require(:kimono).permit(:image, :kind_list, :use_list)
  end

  def update_params
    params.require(:kimono).permit(:image, :kind_list, :use_list)
  end
end
