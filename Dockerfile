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


RUN useradd -ms /bin/bash memcached
USER memcached
WORKDIR /home/memcached
# Command to run
CMD ["memcached", "-u memcached -l 0.0.0.0 -p 11211 -m 4096 -c 2048 -t 4 -v"]

# Expose listen port
EXPOSE 11211
