#!/bin/bash

# Start Memcached
echo "Starting Memcached..."
memcached -u 0 -l 0.0.0.0 $@