class BookingsController < ApplicationController
  def index
  end

  def show
    @booking = Booking.find(params[:id])
  end

  # def new
  #   @booking = Booking.new
  # end

  def create
    @fridge = Fridge.find(params[:fridge_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.fridge = @fridge
    @booking.status = 'pending'
    if @booking.save
      redirect_to dashboard_path
    else
      render 'fridges/show'
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(params[:booking])

    redirect_to dashboard_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
