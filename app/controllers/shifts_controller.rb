class ShiftsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @shift = Shift.new
    @shift.user = current_user
  end

  def edit
  end

  def create
    @shift = Shift.new
    @shift.start = Time.new(
      params["shift"]["date(1i)"].to_i,
      params["shift"]["date(2i)"].to_i,
      params["shift"]["date(3i)"].to_i,
      params["shift"]["start_time(4i)"].to_i,
      params["shift"]["start_time(5i)"].to_i
    )
    @shift.finish = Time.new(
      params["shift"]["date(1i)"].to_i,
      params["shift"]["date(2i)"].to_i,
      params["shift"]["date(3i)"].to_i,
      params["shift"]["finish_time(4i)"].to_i,
      params["shift"]["finish_time(5i)"].to_i
    )
    @shift.break_length = params["shift"]["break_length"]
    @shift.user_id = current_user.id
    @shift.organisation_id = params["organisation_id"].to_i
    @shift = Shift.new unless @shift.save
    redirect_back(fallback_location: root_path)
  end

  def update
    @shift.update(shift_params)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @shift.destroy
    redirect_to root
  end
end
