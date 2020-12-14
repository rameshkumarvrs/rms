class Reservation < ApplicationRecord
  belongs_to :restarent

  def get_list
  	byebug
  	final_value = {}
  	final_value["restarent_id"] = self.restarent_id
  	final_value["guest_count"] = self.restarent.guests.last.guest_count ? self.restarent.guests.last.guest_count : []
  	final_value["table_name"] = self.restarent.tablename ? self.restarent.tablename : []
  	final_value["guest_name"] = self.restarent.guests.last.guest_name ? self.restarent.guests.last.guest_name : []
  	final_value["reservation_time"] = self.restarent.guests.last.time ? self.restarent.guests.last.time : []
  	final_value
  end
end
