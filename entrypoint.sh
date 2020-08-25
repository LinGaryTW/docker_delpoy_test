#! /bin/sh
RAILS_ENV=test
RAILS_ENV=test bundle exec rake db:migrate &&\
RAILS_ENV=test bundle exec rspec
