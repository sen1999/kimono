class ItemsController < ApplicationController
  def show
    @items = Item.all
    @item = Item.new
  end

  def create
    # @tansu = Tansu.new(params[:memo])
     Item.create(create_params)
    @items = Item.all
  end

  def destroy
    Item.find(params[:id]).destroy
    @items = Item.all
  end
# def edit
# @answer = Answer.find(params[:id])
# @question = @answer.question
# end

# def update
# @answer = Answer.find(params[:id])
# @question = @answer.question
# @answer.update(update_params)
# end
  def edit
    Item.find(params[:id]).edit
  end

  def update
    Item.find(params[:id]).update(update_params)
  end
private
  def create_params
    params.require(:item).permit(:memo, :image)
  end

  def update_params
    params.require(:item).permit(:memo, :image)
  end
end
