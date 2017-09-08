class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def is_valid?
    enough_tickets
    tall_enough
    errors.count == 0 ? true:false
  end

  def take_ride
    if !is_valid?
      "Sorry. " + errors.messages[:user_id].join(" ")
    else
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save
    end
  end

  def enough_tickets
    if user.tickets < attraction.tickets
      errors.add(:user_id, "You do not have enough tickets to ride the #{attraction.name}.")
    end
  end

  def tall_enough
    if user.height < attraction.min_height
      errors.add(:user_id, "You are not tall enough to ride the #{attraction.name}.")
    end
  end

end
