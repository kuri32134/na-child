class Public::BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @booking_children = @booking.booking_children.build
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to public_booking_path(booking.id)
    else
      render action: :new
    end
  end

  def index
  end

  def show
  end
  
  private

  def booking_params
    params.require(:booking).permit(:name, booking_children_attributes: [:id, :booking_id, :name_of_child, :age_of_child, :_destroy])
  end
  
  
end
