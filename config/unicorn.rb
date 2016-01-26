# set path to application
app_dir = File.expand_path("../..", __FILE__)
shared_dir = "#{app_dir}/shared"
app_name = "sampleapp"
working_directory app_dir


# Set unicorn options
worker_processes 2
preload_app true
timeout 30

# Set up socket location
listen "#{shared_dir}/sockets/unicorn.#{app_name}.sock", :backlog => 64

# Logging
stderr_path "#{shared_dir}/log/unicorn.#{app_name}.stderr.log"
stdout_path "#{shared_dir}/log/unicorn.#{app_name}.stdout.log"

# Set master PID location
pid "#{shared_dir}/pids/unicorn.#{app_name}.pid"
