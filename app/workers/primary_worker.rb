class PrimaryWorker
  include Sneakers::Worker
  from_queue :job_queue
  # { 
    #handler: Sneakers::Handlers::Maxretry, 
   # retry_routing_key: 'primary',    
    #arguments: { :'x-dead-letter-exchange' => "activejob-retry" } 
 # }
def work(msg)
    begin
      #job_data = ActiveSupport::JSON.decode(msg)
      #ActiveJob::Base.execute job_data
      ack!
    rescue
      reject!
    end
  end
end