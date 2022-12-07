class BookingsController < ApplicationController
  def create
    @booking = Booking.new
    @booking.user = current_user
    # raise
    @event = Event.find(params[:event_id])
    @booking.event = @event
    if @booking.save
      redirect_to event_path(@event), notice: "Request sent to owner."
    else
      render :new, status: :unprocessable_entity
    end
  end
end
