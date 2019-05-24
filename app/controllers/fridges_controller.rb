class FridgesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new]
  def index
    # @fridges = Fridge.all
    @fridges = policy_scope(Fridge)
  end

  def show
    @fridge = Fridge.find(params[:id])
  end

  def new
    @fridge = Fridge.new
  end

  def create
    @fridge = Fridge.new(fridge_params)
    if @fridge.save
      redirect_to fridge_path(@fridge)
    else
      render :new
    end
    authorize @fridge if @user[:category] == "owner"
  end

  def edit
    @fridge = Fridge.find(params[:id])
  end

  def update
    @fridge = Fridge.find(params[:id])
    @fridge.update(fridge_params)
    redirect_to fridges_path
  end

  def destroy
    @fridge = Fridge.find(params[:id])
    @fridge.destroy
    redirect_to fridges_path
  end

  private

  def fridge_params
    params.require(:fridge).permit(:name, :address, :brand, :availability, :description, :photo, :capacity, :price)
  end
end
