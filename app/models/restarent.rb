class Restarent < ApplicationRecord
	has_many :guests
	has_many :reservations
	has_many :table_names
end
