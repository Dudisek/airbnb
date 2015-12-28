rails: bundle exec rails s
sidekiq: bundle exec sidekiq
redis: redis-server
web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-production}