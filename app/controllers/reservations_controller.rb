class ReservationsController < ApplicationController
	skip_before_action :verify_authenticity_token  
	def create
		table_names = ["couple", "Join Family"]
		#byebug
		final_value = {}
		if table_names.include?(params[:name])
			#byebug
			final_value["table_name"] = params[:name]
			get_shift_reservation_time = ShiftTime.where(name: params["shift"]).first
			start_time_table = get_shift_reservation_time.strat_time
			end_time_table = get_shift_reservation_time.end_time
			 if params[:shift_time].between?(start_time_table, end_time_table)
			 	 final_value["reservation_time"] = params[:shift_time]
			 else
			 	 final_value["reservation_time"] =  "you are Entering wrong shift time"
			 end	
		  get_table_count = TableName.where(name: params[:name]).first
		  min_count = get_table_count.min_count.to_s
			max_count = get_table_count.max_count.to_s
		  	if params[:guest_count].between?(min_count, max_count)
			 	 final_value["guest_name"] = params[:guest_name]
			 	 final_value["guestcount"] = params[:guest_count]
			  else
			 	 #final_value["guest_name"] = params[:guest_name]
			 	 final_value["guestcount"] = "The value you enter the count is not applicable to this table"
			  end	
		else
		 	final_value["table_name"] = "please send a proper table name"
		end	
        final_value
		 
		 respond_to do |format|
      format.json { render json: final_value, status: "200" }
		 end	
	end
end
