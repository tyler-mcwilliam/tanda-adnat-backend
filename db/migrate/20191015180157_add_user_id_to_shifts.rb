class AddUserIdToShifts < ActiveRecord::Migration[5.2]
  def change
    add_column :shifts, :user_id, :integer
  end
end
