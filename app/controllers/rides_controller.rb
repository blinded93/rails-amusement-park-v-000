class RidesController < ApplicationController

  def create
    @ride = Ride.new(ride_params)
    if @ride.is_valid?
      @ride.take_ride
      @ride.save
      redirect_to "/users/#{@ride.user_id}", notice: "Thanks for riding the #{@ride.attraction.name}!"
    else
      redirect_to "/attractions/#{@ride.attraction_id}", notice: ("Sorry. " + @ride.errors.messages[:user_id].join(" ") + "Stay happy!" + "Your Tickets: #{@ride.user.tickets}")
    end
  end

  private
    def ride_params
      params.require(:ride).permit(:attraction_id, :user_id)
    end
end
