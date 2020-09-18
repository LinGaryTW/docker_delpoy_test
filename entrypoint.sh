#! /bin/sh
RAILS_ENV=test
git checkout ${BRANCH}
RAILS_ENV=test bundle exec rake db:migrate &&\
RAILS_ENV=test bundle exec rspec
