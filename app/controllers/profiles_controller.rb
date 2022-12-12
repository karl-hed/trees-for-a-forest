class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @events_array = []
    @user.bookings.each do |booking|
      if booking.event.date < Date.today && booking.event != nil
        @events_array << booking.event
      end
    end
    @events = @events_array.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        info_window: render_to_string(partial: "info_window", locals: { event: event }),
        image_url: helpers.asset_url("simple_logo")
      }
    end
    @events_array
    @events
  end
end
