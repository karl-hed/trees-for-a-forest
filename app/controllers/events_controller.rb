class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]

  def index
    @events = Event.all

  end

  def show
    @event = Event.find(params[:id])
    @booking = Booking.new
    @bookings = Booking.where(event: @event) # Booking.includes(:user).where(event: @event)
  end

  def new
  end

  # def new
  #   @event = Event.new
  #   @organization = Organization.find(params[:organization_id])
  # end

  # def create
  #   @organization = Organization.find(params[:organization_id])
  #   @event = Event.new(event_params)
  #   @event.organization = @organization
  #   if @event.save
  #     redirect_to organization_path(@organization), notice: "event was successfully created."
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  # def edit
  # end

  # def update
  #   if @event.update(event_params)
  #     redirect_to @event, notice: "event was successfully updated."
  #   else
  #     render :edit, status: :unprocessable_entity
  #   end
  # end

  # def destroy
  #   @event.destroy
  #   redirect_to root_path, notice: "event was successfully destroyed."
  # end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :date, :time, :latitude, :longitude, :region, :capacity)
  end
end
