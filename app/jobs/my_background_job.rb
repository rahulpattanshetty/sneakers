class MyBackgroundJob < ApplicationJob
  queue_as :job_queue
  			 
  rescue_from(StandardError) do |exception|
      retry_job wait: 5.minutes, queue: :job_queue     
  end

  def perform(user)
   	@user = user
    ExampleMailer.sample_email(@user).deliver!
  # ack!
  end
  
  after_perform do |job|
      
    connection = Bunny.new(hostname:'localhost')
    connection.start
    channel = connection.create_channel            
    queue = channel.queue('job_queue')
    channel.default_exchange.publish(job.queue_name, routing_key:queue.name,durable:true)
    #queue.subscribe(block: true) do |_delivery_info, _properties, body|
    #puts _delivery_info
    #puts _properties
    #puts body
    
  #end
    #queue.subscribe(block: true) do |delivery_info, _properties, body|
    
    #channel.ack(delivery_info.delivery_tag)
    #binding.pry
    #end
    #binding.pry
    connection.close
  end         
end
