class TansuController < ApplicationController
  def show
    @tansu = Tansu.all
  end

  def new
    @tansu = Tansu.new
  end

  def index
    @tansus = Tansu.all
    @tansu = Tansu.new
  end

  def create
    # @tansu = Tansu.new(params[:memo])
    @tansu = Tansu.create(create_params)
    @tansu.save
    @tansus = Tansu.all
  end

  def create_params
    params.require(:tansu).permit(:memo, :image)
  end

end
