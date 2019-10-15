class Shift < ApplicationRecord
  belongs_to :user

  attr_accessor :date, :start_time, :finish_time

  def cost
    hours_worked * Organisation.find(organisation_id).hourly_rate
  end

  def hours_worked
    (((finish - start) / 60) - break_length) / 60
  end
end
