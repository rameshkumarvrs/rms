class ReservationsController < ApplicationController
	skip_before_action :verify_authenticity_token  

	# post - localhost:3000/reservations
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
			 	 @reservation_details = Reservation.new(reserve_values)
			 	 @reservation_details.guest_count = params["guest_count"]
			 	 @reservation_details.reservation_time = params["shift_time"]
			 	 if @reservation_details.save
			 	 	@guest_details = Guest.new
			 	 	@guest_details.guest_name = params[:guest_name]
			 	 	@guest_details.guest_email = params[:guest_email]
			 	 	@guest_details.restarent_id = params[:restarent_id]
			 	 	@guest_details.time = params[:shift_time]
			 	 	@guest_details.guest_count = params[:guest_count]
			 	 	@guest_details.save
			 	 	#byebug
			 	 	  ExampleMailer.sample_email(@reservation_details).deliver
			 	 	 puts "reservation done"
			 	 else
			 	 	 puts "some errors"
			 	 end	
			  else
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

  def get_reservation_list
  	reservation = Reservation.where(restarent_id: params[:id]).last
  	#byebug
  	reservation_list = reservation.get_list
  	respond_to do |format|
      format.json { render json: reservation_list, status: "200" }
		 end	
  end
  
  # localhost:3000//reservations/:id
  def update
  	@reservation_update = Reservation.find(params[:id])
  	@old_reservation_time = @reservation_update.reservation_time
  	@old_guest_count = @reservation_update.guest_count 
  	@reservation_update.update(guest_count: params[:guest_count], reservation_time: params[:shift_time])
  	if @reservation_update
  		#byebug
  		ExampleMailer.update_reservation(@old_reservation_time,@old_guest_count,@reservation_update).deliver
       respond_to do |format|
      format.json { render json: @reservation_update, status: "200" }
		 end
  	#else
  	
  	end	
  	#byebug 
  end

	#private
	 def reserve_params
      params.require(:reservation).permit(:name, :email, :guest_name, :guest_email, :rest_name, :rest_email, :guestcount, :phone)
   end

   def reserve_values
   	  params.require(:reservation).permit(:restarent_id, :guestcount, )
   end

   #def guest_params
   	# params.require(:reservation).permit(:restarent_id, :guest_name, :guest_email )
   #end
end
