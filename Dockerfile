FROM frodenas/ubuntu

# Install Memcached 1.6.5
RUN DEBIAN_FRONTEND=noninteractive && \
    apt-get install -y --force-yes \
    libevent-dev \
    && cd /tmp && \
    wget http://memcached.org/files/memcached-1.6.5.tar.gz && \
    tar xzvf memcached-1.6.5.tar.gz && \
    cd memcached-1.6.5 && \
    apt-get install -y --force-yes libevent-dev && \
    ./configure && \
    make && \
    make install && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Script
ADD scripts /scripts
RUN chmod +x /scripts/*.sh

RUN useradd -ms /bin/bash memcached

# Command to run
ENTRYPOINT ["/scripts/run.sh"]
CMD [""]

# Expose listen port
EXPOSE 11211
