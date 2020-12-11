class CreateShiftTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :shift_times do |t|
      t.string :name
      t.string :strat_time
      t.string :end_time
      t.references :restarent, foreign_key: true

      t.timestamps
    end
  end
end
