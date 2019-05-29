class UsersController < ApplicationController
  def dashboard
    # bookings c'est moi qui demande
    # reservations je reçoi une demande


    @bookings = current_user.bookings
    @fridges = current_user.fridges
    @reservations = current_user.reservations
  end
end
