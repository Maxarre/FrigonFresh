class UsersController < ApplicationController
  def dashboard
    @bookings = current_user.bookings
    @fridges = current_user.fridges
    @reservations = current_user.reservations
  end
end
