require 'sneakers'
require 'sneakers/metrics/logging_metrics'


Sneakers.configure  amqp: "amqp://guest:guest@localhost:15672",
                    # username:"guest",
                    # password:"guest",
                    # hostname:"localhost",
                    vhost:'/',
                    log: "log/sneakers.log",
                    pid_path: "tmp/pids/sneakers.pid",
                    heartbeat: 2,
                    # vhost:'test',
                    exchange: 'sneakers',
              		  exchange_type: :direct,
              		  daemonize: false,
              		  ack: true,
              		  # handler: Sneakers::Handlers::Maxretry
                    metrics: Sneakers::Metrics::LoggingMetrics.new,
                    # daemonize: false,
                    # heartbeat_interval: 2000,
                    # start_worker_delay: 0.2,
                     durable: true
                    # retry_timeout: 30000,
                    # retry_max_times: 3,
                    # timeout_job_after: 60,
                    # threads: 4,
                    # prefetch: 4
                    # # log: STDOUT
 Sneakers.logger.level = Logger::INFO

# Sneakers.configure  heartbeat: 2000,
#                     amqp: "amqp://ubuntu:ubuntu@192.168.0.12:5672",
#                     vhost: "test",
#                     metrics: Sneakers::Metrics::LoggingMetrics.new,
#                     daemonize: false,
#                     heartbeat_interval: 2000,
#                     start_worker_delay: 0.2,
#                     durable: true,
#                     ack: true,
#                     workers: 5,
#                     retry_timeout: 30000,
#                     retry_max_times: 3,
#                     timeout_job_after: 60,
#                     threads: 4,
#                     prefetch: 4,
#                     log: STDOUT
  #                     retry_exchange: 'activejob-retry',
  # retry_error_exchange: 'activejob-error',
  # retry_requeue_exchange: 'activejob-retry-requeue'
# Sneakers.logger.level = Logger::INFO