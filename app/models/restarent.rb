class Restarent < ApplicationRecord
	has_many :guests
	has_many :reservations
	has_many :table_names

def self.search(name, tablename)
    where("name LIKE ? AND tablename LIKE ? ", "%#{name}%", "%#{tablename}%")
  end

end
