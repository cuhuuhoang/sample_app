pkill -f unicorn
unicorn_rails -E production -c config/unicorn.rb -D
service nginx restart
