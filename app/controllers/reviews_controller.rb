class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit update destroy]
  before_action :set_organization, only: %i[new create show edit update destroy]
  before_action :set_booking, only: %i[new create show edit update destroy]

  def create
    # raise
    @review = Review.new(review_params)
    # TODO: (Fred 09-12-22) Code temporaire pour permettre au review de fonctionner durant le démo intermédiaire.
    # À remplacer la semaine prochaine OK DONE
    # @booking = Booking.joins(:user, event: :organization)
    #                   .where(users: { id: current_user.id })
    #                   .where(organization: { id: params[:organization_id] })
    #                   .first
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking

    # raise
    if @review.save
      redirect_to organization_path(@booking.organization) # has_one :organization, through: :event
      # redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @review = Review.new
    # raise
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end

  def set_organization
    # @organization = Organization.find(params[:organization_id])
  end

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end
end
