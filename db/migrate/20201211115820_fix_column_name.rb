class FixColumnName < ActiveRecord::Migration[5.2]
  def change
  	rename_column :guests, :name, :guest_name
  	rename_column :guests, :email, :guest_email
  	#rename_column :restarents, :name, :rest_name
  	#rename_column :restarents, :email, :rest_email
  end
end
