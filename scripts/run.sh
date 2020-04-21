#!/bin/bash

# Start Memcached
echo "Starting Memcached..."
memcached -u daemon -l 0.0.0.0 -p 11211 -m 4096 -c 2048 -t 4 -v $@