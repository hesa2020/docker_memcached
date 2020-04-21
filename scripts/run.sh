#!/bin/bash

# Start Memcached
echo "Starting Memcached..."
memcached -u daemon -l 0.0.0.0 $@