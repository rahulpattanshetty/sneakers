
require 'sneakers'
class SendMail 
	include Sneakers::Worker
	  from_queue  'mailer'
	  #handler: Sneakers::Handlers::Maxretry,
       #     arguments: { :"x-dead-letter-exchange" => "mailer-retry" }
	def work
		err = JSON.parse(msg)
    	@user = User.first
        ExampleMailer.sample_email(@user).deliver!	
        #binding.pry
     #ack!
 	end
	
end
