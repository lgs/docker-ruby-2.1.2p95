# Dockerfile for Ruby 2.1.1 (Current stable)
#
# VERSION 1.0

FROM debian:jessie

MAINTAINER Luca G. Soave <luca.soave@gmail.com>

# Change REFRESHED_AT date, to force the upgrade
ENV REFRESHED_AT 2014-15-03

# Make sure the package repository is up to date
RUN apt-get -qq update && apt-get install -y wget tar ca-certificates git

# Download, compile & Install Ruby
RUN apt-get -y install build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev && \
    wget http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.1.tar.gz &&\
    tar -xzf ruby-2.1.1.tar.gz && \
    (cd ruby-2.1.1/ && ./configure --disable-install-doc && make && make install) && \
    rm -rf ruby-2.1.1/ && rm -f /ruby-2.1.1.tar.gz

# Install bundler
RUN gem install bundler --no-rdoc --no-ri

# Clean up APT when done
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

