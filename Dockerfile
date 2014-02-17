FROM stackbrew/ubuntu:trusty
MAINTAINER Tiago Scolari <tscolari@gmail.com>

ENV USERNAME foo
ENV PASSWORD bar

RUN sudo apt-get update;
RUN sudo apt-get install software-properties-common -y;
RUN sudo add-apt-repository ppa:brightbox/ruby-ng &&\
    sudo apt-get update;
RUN sudo apt-get install ruby2.1 ruby2.1-dev make -y &&\
    sudo apt-get clean -y && apt-get autoclean -y;

RUN gem install bundler

RUN mkdir /var/gems
RUN mkdir /geminabox

VOLUME /var/gems

WORKDIR /geminabox
ADD Gemfile ./geminabox/
ADD Gemfile.lock ./geminabox/
RUN bundle install

ADD config.ru ./geminabox/
ADD unicorn.rb ./geminabox/

ENV PORT 6444
CMD ["bundle", "exec", "unicorn", "-c", "/geminabox/unicorn.rb"]
