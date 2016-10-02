class ItemsController < ApplicationController

  def show
    @items = Item.all
  end

  # def show
  #   @item = Item.find(params[:id])
  # end

  def new
    @items = Item.all
    @item = Item.new
  end

  def create
    Item.create(create_params)
    @items = Item.all
  end

  def destroy
    Item.find(params[:id]).destroy
    @items = Item.all
  end

  def edit
    binding.pry
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id]).update(update_params)
  end
private
  def create_params
    params.require(:item).permit(:memo, :image)
  end

  def update_params
    params.require(:item).permit(:memo, :image)
  end
end
