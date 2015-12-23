rails: bundle exec rails s
sidekiq: bundle exec sidekiq
redis: redis-server
elasticsearch: ./elasticsearch-0.20.6/bin/elasticsearch -f
web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-production}