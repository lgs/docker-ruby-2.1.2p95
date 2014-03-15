# Ruby 2.1.1 Dockerfile
#
# VERSION 1.0

FROM debian:jessie

MAINTAINER Luca G. Soave <luca.soave@gmail.com>

# Change REFRESHED_AT date 
# to force local image update
#
ENV REFRESHED_AT 2014-15-03

# Update apt, download, compile and install Ruby and accessory lib
ADD http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.1.tar.gz / 
RUN apt-get -qq update && apt-get install -yqq tar git && tar -xzf ruby-2.1.1.tar.gz && \
    apt-get install -yqq build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev && \
    (cd ruby-2.1.1/ && ./configure --disable-install-doc && make && make install) && \
    rm -rf ruby-2.1.1/ && rm -f /ruby-2.1.1.tar.gz

# Install bundler
RUN gem install bundler --no-rdoc --no-ri

# Clean up APT when done
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


