FROM stackbrew/ubuntu:xenial
MAINTAINER Tiago Scolari <tscolari@gmail.com>

RUN apt-get update;
RUN apt-get install software-properties-common -y;
RUN add-apt-repository ppa:brightbox/ruby-ng &&\
    apt-get update;
RUN apt-get install ruby2.4 ruby2.4-dev make -y &&\
    apt-get clean -y && apt-get autoclean -y;

RUN gem install bundler

RUN mkdir /var/gems
RUN mkdir /geminabox

VOLUME /var/gems

ADD Gemfile ./geminabox/
ADD Gemfile.lock ./geminabox/
ADD config.ru ./geminabox/
ADD unicorn.rb ./geminabox/
WORKDIR /geminabox
RUN bundle install

ENV PORT 6444
CMD ["bundle", "exec", "unicorn", "-c", "/geminabox/unicorn.rb"]
