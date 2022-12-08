class BookingsController < ApplicationController
  def create
    @booking = Booking.new
    @booking.user = current_user
    # raise
    @event = Event.find(params[:event_id])
    @booking.event = @event
    # @bookings = Booking.all
    # @users = User.find()
    if @booking.save
      redirect_to event_path(@event), notice: "Subscribed to event."
    else
      render :new, status: :unprocessable_entity
    end
  end
end
