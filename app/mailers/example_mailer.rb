class ExampleMailer < ApplicationMailer
	default from: "from@example.com"

 def sample_email(user)
 	#byebug
    @user = user
    mail(to: @user.restarent.email, subject: 'Restarent Registration')
  end

  def update_reservation(old_time, old_count, reservation)
  	@user = reservation
  	@old_time = old_time
  	@old_count = old_count
    mail(to: @user.restarent.email, subject: 'Update Registration')
  end

end
