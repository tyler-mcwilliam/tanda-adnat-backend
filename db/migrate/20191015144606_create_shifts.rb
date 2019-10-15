class CreateShifts < ActiveRecord::Migration[5.2]
  def change
    create_table :shifts do |t|
      t.datetime :start
      t.datetime :finish
      t.integer :break_length
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
