FROM stackbrew/ubuntu:trusty
MAINTAINER Tiago Scolari <tscolari@gmail.com>

RUN sudo apt-get update;
RUN sudo apt-get install software-properties-common -y;
RUN sudo add-apt-repository ppa:brightbox/ruby-ng &&\
    sudo apt-get update;
RUN sudo apt-get install ruby2.4 ruby2.4-dev make -y &&\
    sudo apt-get clean -y && apt-get autoclean -y;

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
