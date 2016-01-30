RAILS_ENV=production rake db:migrate
RAILS_ENV=production rake assets:precompile
pkill -f unicorn
unicorn_rails -E production -c config/unicorn.rb -D
service nginx restart
