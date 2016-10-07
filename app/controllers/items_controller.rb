class ItemsController < ApplicationController

  def index
    @kimonos = Kimono.all
    @belts = Belt.all
    @collars = Collar.all
  end

  def show
    @kimono = Kimono.find(params[:id])
    # @belt = Belt.find(params[:id])
  end

  def new
    @kimonos = Kimono.all
    @kimono = Kimono.new

    @belts = Belt.all
    @belt = Belt.new

    @collars = Collar.all
    @collar = Collar.new
  end

  def create
    binding.pry
    Kimono.create(kimono_params)
    @kimonos = Kimono.all

    Collar.create(collar_params)
    @collars = Collar.all


    Belt.create(belt_params)
    @belt = Belt.all
    redirect_to :acton => "items#index"
  end

  def destroy
    Kimono.find(params[:id]).destroy
    @kimonos = Kimono.all
    # Belt.find(params[:id]).destroy
    # @belts = Belt.all
  end

  def edit
    @kimono = Kimono.find(params[:id])
  end

  def update
    # @kimono = Kimono.find(params[:id]).update(update_params)
    Kimono.update(update_params)
    redirect_to :bacj
  end
private

  case params[:flag]
  when kimono
    def kimono_params
      params.require(:kimono).permit(:image, :use_list)
    end

  when collar
    def belt_params
      params.require(:belt).permit(:image, :use_list)
    end

  when belt
    def collar_params
    params.require(:collar).permit(:image, :use_list)
  end

  else
  end
end
