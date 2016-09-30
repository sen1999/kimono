class TansuController < ApplicationController

  def show
    @tansus = Tansu.all
    @tansu = Tansu.new
  end

  def create
    # @tansu = Tansu.new(params[:memo])
    @tansu = Tansu.create(create_params)
    @tansu.save
    @tansus = Tansu.all
  end

  def destroy
    Tansu.find(params[:id]).destroy
    @tansus = Tansu.all
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
    Tansu.find(params[:id]).edit
  end

  def update
    Tansu.find(params[:id]).update(update_params)
  end

  def create_params
    params.require(:tansu).permit(:memo, :image)
  end

  def update_params
    params.require(:tansu).permit(:memo, :image)
  end
end
