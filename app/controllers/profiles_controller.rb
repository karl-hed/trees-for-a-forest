class ProfilesController < ApplicationController

  def signed_in_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def show
    @user = User.find(params[:id])
    @past_events = []
    @past_bookings = []
    @user.bookings.each do |booking|
      if booking.event.date < Date.today && booking.event != nil
        @past_events << booking.event
        @past_bookings << booking
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

    @upcoming_events = []
    @user.bookings.each do |booking|
      if booking.event.date > Date.today && booking.event != nil
        @upcoming_events << booking.event
      end
    end
  end
end
