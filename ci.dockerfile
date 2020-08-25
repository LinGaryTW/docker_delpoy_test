FROM ruby:2.7.0-alpine
ENV http_proxy=http://172.19.8.10:3128 \
    https_proxy=http://172.19.8.10:3128 \
    no_proxy=localhost,127.0.0.0/8
RUN apk --update add build-base libxslt-dev nodejs sqlite-libs sqlite-dev tzdata npm \
    && rm -rf /var/lib/apt/lists/*
RUN mkdir /gary
WORKDIR /gary
COPY Gemfile Gemfile.lock yarn.lock ./
RUN bundle install
RUN npm install -g yarn && yarn install --check-files
COPY . /gary
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]