rails_env = ENV['RAILS_ENV'] || 'production'

worker_processes 4

working_directory "/var/www/simplecrm/current"

listen "/var/www/simplecrm/shared/pids/simplecrm.sock", :backlog => 64
listen 8080, :tcp_nopush => true

timeout 30

pid "/var/www/simplecrm/shared/pids/unicorn.pid"

stderr_path "/var/www/simplecrm/shared/log/unicorn.stderr.log"
stdout_path "/var/www/simplecrm/shared/log/unicorn.stdout.log"

preload_app true

GC.respond_to?(:copy_on_write_friendly=) and
  GC.copy_on_write_friendly = true

check_client_connection false

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end