class Guest < ApplicationRecord
  belongs_to :restarent

  def self.search(search)
    where("guest_name LIKE ? ", "%#{search}%")
  end
end
