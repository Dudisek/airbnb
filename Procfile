worker: bundle exec sidekiq
redis: redis-server
elasticsearch: elasticsearch
# web: rails s
web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-production}