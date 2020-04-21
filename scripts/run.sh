#!/bin/bash

# Start Memcached
echo "Starting Memcached..."
memcached -u 0 -S -l 0.0.0.0 $@