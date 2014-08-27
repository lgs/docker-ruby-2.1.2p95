# Ruby 2.1.2 Dockerfile
#
# VERSION 1.1

FROM debian:wheezy

MAINTAINER Luca G. Soave <luca.soave@gmail.com>

ADD http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.2.tar.gz / 

# Change REFRESHED_AT date to force local image update
ENV REFRESHED_AT 2014-27-08

RUN apt-get -qq update && apt-get install -y tar git vim build-essential \
    zlib1g-dev libssl-dev libreadline6-dev libyaml-dev && tar -xzf ruby-2.1.2.tar.gz && \
    (cd ruby-2.1.2/ && ./configure --disable-install-doc && make && make install) && \
    rm -rf /ruby-2.1.2* && gem install bundler --no-rdoc --no-ri && apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


