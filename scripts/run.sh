#!/bin/bash

# Start Memcached
echo "Starting Memcached..."
memcached -u deamon -l 0.0.0.0 $@