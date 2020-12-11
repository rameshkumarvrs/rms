class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.string :reservation_time
      t.integer :guest_count
      t.references :restarent, foreign_key: true

      t.timestamps
    end
  end
end
