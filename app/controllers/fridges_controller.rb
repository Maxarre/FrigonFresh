class FridgesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new]

  def index
    # @fridges = Fridge.all
    # @fridges = policy_scope(Fridge)
    if params[:query].present?
      sql_query = "name ILIKE :query OR address ILIKE :query OR brand ILIKE :query"
      @fridges = Fridge.where(sql_query, query: "%#{params[:query]}%")
    else
      @fridges = Fridge.all
    end
    # @maps = Fridge.where.not(latitude: nil, longitude: nil)

    @markers = @fridges.map do |fridge|
      {
        lat: fridge.latitude,
        lng: fridge.longitude,
        infoWindow: render_to_string(partial: "shared/infowindow", locals: { fridge: fridge })

      }
    end
  end

  def show
    @fridge = Fridge.find(params[:id])
    @booking = Booking.new
  end

  def new
    @fridge = Fridge.new
  end

  def create
    @fridge = Fridge.new(fridge_params)
    @fridge.user = current_user
    if @fridge.save
      redirect_to fridges_path
    else
      render :new
    end
    # authorize @fridge if @user[:category] == "owner"
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
