FROM frodenas/ubuntu

# Install Memcached 1.4.20
RUN DEBIAN_FRONTEND=noninteractive && \
    apt-get install -y --force-yes \
    libevent-dev \
    && cd /tmp && \
    wget http://memcached.org/files/memcached-1.4.20.tar.gz && \
    tar xzvf memcached-1.4.20.tar.gz && \
    cd memcached-1.4.20 && \
    apt-get install -y --force-yes libevent-dev && \
    ./configure && \
    make && \
    make install && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add scripts
ADD scripts /scripts
RUN chmod +x /scripts/*.sh

# Command to run
ENTRYPOINT ["/scripts/run.sh"]
CMD [""]

# Expose listen port
EXPOSE 11211
