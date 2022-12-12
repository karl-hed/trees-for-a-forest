class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @events_array = []
    @user.bookings.each do |booking|
      @events_array << booking.event
      # if booking.event.date < Date.today && booking.event != nil
        # @events_array << booking.event
      # end
    end
    @events_array
  end
end
