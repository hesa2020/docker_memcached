#!/bin/bash

# Start Memcached
echo "Starting Memcached..."
memcached -u daemon -S -l 0.0.0.0 $@