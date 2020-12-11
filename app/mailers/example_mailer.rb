class ExampleMailer < ApplicationMailer
	default from: "from@example.com"

 def sample_email(user)
 	byebug
    @user = user
    mail(to: @user.restarent.email, subject: 'Restarent Registration')
  end

end
