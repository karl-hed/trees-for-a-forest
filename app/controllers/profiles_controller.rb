class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @past_events = []
    @user.bookings.each do |booking|
      if booking.event.date < Date.today && booking.event != nil
        @past_events << booking.event
      end
    end
    @markers = @past_events.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        info_window: render_to_string(partial: "info_window", locals: { event: event }),
        image_url: helpers.asset_url("tree.png")
      }
    end
  end
end
