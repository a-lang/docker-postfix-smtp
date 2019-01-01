From ubuntu:trusty
MAINTAINER Alang <alang.hsu@gmail.com>

# Set noninteractive mode for apt-get
ENV DEBIAN_FRONTEND noninteractive

# Update
RUN apt-get update

# Start editing
# Install package here for cache
RUN apt-get -y install supervisor postfix sasl2-bin \
    opendkim opendkim-tools && \
    rm -rf /var/lib/apt/lists/*

# Disable 
RUN update-rc.d -f postfix remove
RUN update-rc.d -f opendkim remove

# Add files
ADD startup.sh /opt/startup.sh
RUN chmod a+x /opt/startup.sh

# Run
CMD /opt/startup.sh;/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
