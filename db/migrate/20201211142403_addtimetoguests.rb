class Addtimetoguests < ActiveRecord::Migration[5.2]
  def change
  	add_column :guests, :time, :string
  	add_column :guests, :guest_count, :string
  end
end
