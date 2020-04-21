#!/bin/bash

# Start Memcached
echo "Starting Memcached..."
memcached -l 0.0.0.0 $@