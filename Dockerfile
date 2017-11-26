FROM ruby:2.4

MAINTAINER Valmik Roy <valmikroy@gmail.com>

RUN gem install bundle
ADD . /tmp/quatum
WORKDIR /tmp/quatum
RUN bundle install --system

EXPOSE 8080

CMD ["rackup", "-q",  "config.ru"]
